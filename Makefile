all:
	./scripts/build.sh
	yarn install --cwd web/source/
	./scripts/bundle.sh

deploy:
	scp gotosocial deploy@generous-kitchin.webschuur.com:/u/apps/gotosocial/current/
	scp -r web/assets/ deploy@generous-kitchin.webschuur.com:/u/apps/gotosocial/current/web/
