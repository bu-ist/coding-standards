#!/usr/bin/env bash

phpfiles=$(git ls-files -om --exclude-standard '*.php' '**/*.php' ':!:*.asset.php' ':!:build/*')

if [ ! -z "$phpfiles" ]
then
	./dev/phpcs/vendor/bin/phpcbf --colors --extensions=php $phpfiles
	./dev/phpcs/vendor/bin/phpcs --colors --extensions=php $phpfiles
fi
