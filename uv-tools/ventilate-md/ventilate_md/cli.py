import sys
import argparse
import spacy

nlp = spacy.load("en_core_web_sm")


def ventilate(text: str) -> str:
    doc = nlp(text)
    return "\n".join(sent.text.strip() for sent in doc.sents)


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
