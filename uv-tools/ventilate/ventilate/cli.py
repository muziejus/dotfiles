#!/usr/bin/env python3
"""
ventilate daemon: fast Markdown/LaTeX sentence-per-line formatting.
Uses spaCy sentencizer, keeps pipeline in memory.
"""

import sys
import requests
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
import spacy
import time
import threading


PORT = 4142
HOST = "127.0.0.1"
nlp = spacy.blank("en")
nlp.add_pipe("sentencizer")


def ventilate(text: str) -> str:
    paragraphs = text.split("\n\n")
    ventilated_paragraphs = []

    for paragraph in paragraphs:
        stripped = paragraph.strip()
        if not stripped:
            ventilated_paragraphs.append("")
            continue

        if (
            len(stripped) < 30
            or stripped.count(".") + stripped.count("!") + stripped.count("?") <= 1
        ):
            ventilated_paragraphs.append(stripped)
            continue

        doc = nlp(paragraph)
        sentences = [sent.text.strip() for sent in doc.sents]
        ventilated_paragraphs.append("\n".join(sentences))

    return "\n\n".join(ventilated_paragraphs)


class VentilateHandler(BaseHTTPRequestHandler):
    def do_POST(self):
        if self.path != "/ventilate":
            self.send_error(404)
            return

        content_length = int(self.headers.get("Content-Length", 0))
        post_data = self.rfile.read(content_length)
        text = post_data.decode("utf-8")
        result = ventilate(text)

        encoded_result = result.encode("utf-8")

        self.send_response(200)
        self.send_header("Content-Type", "text/plain; charset=utf-8")
        self.send_header("Content-Length", str(len(encoded_result)))
        self.end_headers()
        self.wfile.write(encoded_result)

    def log_message(self, format, *args):
        return


def run_server():
    server_address = (HOST, PORT)
    httpd = ThreadingHTTPServer(server_address, VentilateHandler)
    sys.stderr.write(f"Ventilate daemon running on port {PORT}...\n")
    sys.stderr.flush()
    httpd.serve_forever()


def ensure_server_running():
    try:

        requests.get(f"http://{HOST}:{PORT}/ventilate")
    except requests.exceptions.ConnectionError:
        sys.stderr.write("Ventilate daemon not running, starting it...\n")
        sys.stderr.flush()
        t = threading.Thread(target=run_server, daemon=True)
        t.start()
        time.sleep(1)


def post_to_server(text: str) -> str:
    resp = requests.post(f"http://{HOST}:{PORT}/ventilate", data=text.encode("utf-8"))
    if resp.status_code == 200:
        return resp.text
    else:
        return text


def main() -> None:
    input_text = sys.stdin.read()
    try:
        print(post_to_server(input_text), end="")
    except requests.exceptions.ConnectionError:
        ensure_server_running()
        print(post_to_server(input_text), end="")


if __name__ == "__main__":
    main()
