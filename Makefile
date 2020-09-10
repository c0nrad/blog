
run:
	hugo server -D

deploy:
	./deploy.sh

new-post: 
	hugo new content/posts/my-new-post.md
