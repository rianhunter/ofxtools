test:
	coverage erase
	python `which nosetests` -dsv --with-coverage --cover-package ofxtools tests/*.py

clean:
	find -regex '.*\.pyc' -exec rm {} \;
	find -regex '.*~' -exec rm {} \;
	rm -rf reg-settings.py
	rm -rf MANIFEST dist build *.egg-info
	rm -rf test.db

install:
	make clean
	make uninstall
	python setup.py install

uninstall:
	pip uninstall -y ofxtools

lint:
	pylint ofxtools/*.py

lint-tests:
	pylint tests/*.py

html:
	sphinx-build -b html docs docs/_build

.PHONY:	test clean lint lint-tests install uninstall
