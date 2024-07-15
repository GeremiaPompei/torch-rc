.DEFAULT_GOAL := check

clean:
	rm -rf torchrc-report
	rm -rf docs/source/api/_autosummary

check:
	pre-commit run -a

isort:
	pycln --config=pyproject.toml torchrc
	isort torchrc

changelog:
	cz bump --changelog

install:
	python3 -m venv .buildenv
	.buildenv/bin/pip install poetry
	.buildenv/bin/poetry install
	rm -rf .buildenv
