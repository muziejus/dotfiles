import sys
import argparse
import spacy

nlp = spacy.load("en_core_web_sm")


def ventilate(text: str) -> str:
    paragraphs = text.split("\n\n")
    ventilated_paragraphs = []

    for paragraph in paragraphs:
        stripped = paragraph.strip()
        if not stripped:
            ventilated_paragraphs.append("")
            continue

        if stripped.count(".") + stripped.count("!") + stripped.count("?") <= 1:
            ventilated_paragraphs.append(stripped)
            continue

        doc = nlp(paragraph)
        sentences = [sent.text.strip() for sent in doc.sents]
        ventilated_paragraphs.append("\n".join(sentences))

    return "\n\n".join(ventilated_paragraphs)


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Ventilate Markdown prose (one sentence per line)."
    )
    parser.add_argument("file", nargs="?", help="Optional input file")
    args = parser.parse_args()

    if args.file:
        with open(args.file, "r") as f:
            text = f.read()
    else:
        text = sys.stdin.read()

    print(ventilate(text))
