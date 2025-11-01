.PHONY: install format lint check clean

install:
	uv sync --all-groups
	uv run pre-commit install
	uv run nbdime config-git --enable
	uv run nbstripout --install --attributes .gitattributes

format:
	uv run black .
	uv run isort .
	uv run nbqa black .
	uv run nbqa isort .

lint:
	uv run pyright
	uv run flake8 .
	uv run nbqa flake8 .
