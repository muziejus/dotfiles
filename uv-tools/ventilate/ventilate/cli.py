import sys
import argparse
import spacy
import re

nlp = spacy.blank("en")
nlp.add_pipe("sentencizer")

MATH_INLINE = re.compile(r"\$.*?\$")
MATH_DISPLAY = re.compile(r"\\\[.*?\\\]", flags=re.S)
ENV_BLOCK = re.compile(r"\\begin\{.*?\}.*?\\end\{.*?\}", flags=re.S)


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

        math_blocks = []

        def mask_math(match):
            math_blocks.append(match.group(0))
            return f"__MATH_{len(math_blocks) - 1}__"

        paragraph_masked = ENV_BLOCK.sub(mask_math, paragraph)
        paragraph_masked = MATH_DISPLAY.sub(mask_math, paragraph_masked)
        paragraph_masked = MATH_INLINE.sub(mask_math, paragraph_masked)

        doc = nlp(paragraph)
        sentences = [sent.text.strip() for sent in doc.sents]

        restored = []
        for sent in sentences:
            for i, math in enumerate(math_blocks):
                sent = sent.replace(f"__MATH_{i}__", math)
            restored.append(sent)

        ventilated_paragraphs.append("\n".join(restored))

    return "\n\n".join(ventilated_paragraphs)


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Ventilate Markdown/LaTeX prose (one sentence per line)."
    )
    parser.add_argument("file", nargs="?", help="Optional input file")
    args = parser.parse_args()

    if args.file:
        with open(args.file, "r") as f:
            text = f.read()
    else:
        text = sys.stdin.read()

    print(ventilate(text))
