import sys
import argparse
import re
import spacy

MATH_INLINE = re.compile(r"\$.*?\$")
MATH_DISPLAY = re.compile(r"\\\[.*?\\\]", flags=re.S)
ENV_BLOCK = re.compile(r"\\begin\{.*?\}.*?\\end\{.*?\}", flags=re.S)


def get_nlp():
    nlp = spacy.blank("en")
    nlp.add_pipe("sentencizer")

    return nlp


# def mask_math(paragraph: str, math_blocks: list[str]) -> str:
#     def replacer(match):
#         math_blocks.append(match.group(0))
#         return f"__MATH_{len(math_blocks) - 1}__"
#
#     paragraph = ENV_BLOCK.sub(replacer, paragraph)
#     paragraph = MATH_DISPLAY.sub(replacer, paragraph)
#     paragraph = MATH_INLINE.sub(replacer, paragraph)
#
#     return paragraph


def ventilate(text: str) -> str:
    nlp = get_nlp()
    paragraphs = text.split("\n\n")
    ventilated_paragraphs = []

    to_parse = []
    parse_positions = []

    for i, paragraph in enumerate(paragraphs):
        stripped = paragraph.strip()
        if (
            not stripped
            or stripped.count(".") + stripped.count("!") + stripped.count("?") <= 1
        ):
            ventilated_paragraphs.append(stripped)
        else:
            ventilated_paragraphs.append(None)  # placeholder
            to_parse.append(stripped)
            parse_positions.append(i)

    for doc, pos in zip(nlp.pipe(to_parse), parse_positions):
        sentences = [sent.text.strip() for sent in doc.sents]
        ventilated_paragraphs[pos] = "\n".join(sentences)

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

    sys.stdout.write(ventilate(text))


if __name__ == "__main__":
    main()
