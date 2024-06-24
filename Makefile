all:
	./scripts/build.sh
	yarn install --cwd web/source/

deploy:
	rsync gotosocial deploy@generous-kitchin.webschuur.com:/u/apps/gotosocial/current/
	scp -r web/assets/ deploy@generous-kitchin.webschuur.com:/u/apps/gotosocial/current/web/
	ssh deploy@generous-kitchin.webschuur.com sudo /bin/systemctl restart gotosocial.service
	ssh deploy@generous-kitchin.webschuur.com sudo /bin/systemctl status gotosocial.service
