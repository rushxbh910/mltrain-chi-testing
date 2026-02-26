all: \
	index.md \
	0_intro.ipynb \
	1_create_server_amd.ipynb \
	1_create_server_nvidia.ipynb \
	2_prepare_data.ipynb \
	7_start_ray.ipynb \
	8_submit_ray.ipynb

clean: 
	rm index.md \
	0_intro.ipynb \
	1_create_server_amd.ipynb \
	1_create_server_nvidia.ipynb \
	2_prepare_data.ipynb \
	7_start_ray.ipynb \
	8_submit_ray.ipynb

index.md: snippets/*.md 
	cat snippets/intro.md \
		snippets/create_server_options.md \
		snippets/prepare_data.md \
		snippets/start_ray.md \
		snippets/submit_ray.md \
		> index.tmp.md
	grep -v '^:::' index.tmp.md > index.md
	rm index.tmp.md
	cat snippets/footer.md >> index.md

0_intro.ipynb: snippets/intro.md
	pandoc --resource-path=../ --embed-resources --standalone --wrap=none \
                -i snippets/frontmatter_python.md snippets/intro.md \
                -o 0_intro.ipynb  
	sed -i.bak 's/attachment://g' 0_intro.ipynb && rm 0_intro.ipynb.bak


1_create_server_amd.ipynb: snippets/create_server_amd.md
	pandoc --resource-path=../ --embed-resources --standalone --wrap=none \
                -i snippets/frontmatter_python.md snippets/create_server_amd.md \
                -o 1_create_server_amd.ipynb  
	sed -i.bak 's/attachment://g' 1_create_server_amd.ipynb && rm 1_create_server_amd.ipynb.bak

1_create_server_nvidia.ipynb: snippets/create_server_nvidia.md
	pandoc --resource-path=../ --embed-resources --standalone --wrap=none \
                -i snippets/frontmatter_python.md snippets/create_server_nvidia.md \
                -o 1_create_server_nvidia.ipynb  
	sed -i.bak 's/attachment://g' 1_create_server_nvidia.ipynb && rm 1_create_server_nvidia.ipynb.bak

2_prepare_data.ipynb: snippets/prepare_data.md
	pandoc --resource-path=../ --embed-resources --standalone --wrap=none \
                -i snippets/frontmatter_python.md snippets/prepare_data.md \
                -o 2_prepare_data.ipynb  
	sed -i.bak 's/attachment://g' 2_prepare_data.ipynb && rm 2_prepare_data.ipynb.bak

7_start_ray.ipynb: snippets/start_ray.md
	pandoc --resource-path=../ --embed-resources --standalone --wrap=none \
				-i snippets/frontmatter_python.md snippets/start_ray.md \
				-o 7_start_ray.ipynb  
	sed -i.bak 's/attachment://g' 7_start_ray.ipynb && rm 7_start_ray.ipynb.bak

8_submit_ray.ipynb: snippets/submit_ray.md
	pandoc --resource-path=../ --embed-resources --standalone --wrap=none \
				-i snippets/frontmatter_python.md snippets/submit_ray.md \
				-o 8_submit_ray.ipynb  
	sed -i.bak 's/attachment://g' 8_submit_ray.ipynb && rm 8_submit_ray.ipynb.bak
