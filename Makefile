all:
	./scripts/build.sh
	yarn install --cwd web/source/
	./scripts/bundle.sh

deploy:
	rsync gotosocial deploy@generous-kitchin.webschuur.com:/u/apps/gotosocial/current/
	scp -r web/assets/ deploy@generous-kitchin.webschuur.com:/u/apps/gotosocial/current/web/
	ssh deploy@generous-kitchin.webschuur.com systemctl restart gotosocial
	ssh deploy@generous-kitchin.webschuur.com systemctl status gotosocial
