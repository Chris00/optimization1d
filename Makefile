WEB = shell.forge.ocamlcore.org:/home/groups/optimization1d/htdocs

PKGVERSION = $(shell git describe --always)

all byte native:
	jbuilder build @install --dev

tests:
	jbuilder runtest

doc:
	jbuilder build --dev @doc
	echo '.def { background: #f0f0f0; }' >> _build/default/_doc/odoc.css

clean:
	jbuilder clean

upload-doc: doc
	scp -C -r _build/src/API.docdir/ $(WEB)/


.PHONY: all byte native tests doc upload-doc clean
