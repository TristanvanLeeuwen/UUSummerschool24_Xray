html: index lecture1 lecture2 lecture3
	cp lectures/lecture1.slides.html html/lecture1.html
	cp lectures/lecture2.slides.html html/lecture2.html
	cp lectures/lecture3.slides.html html/lecture3.html

	cp -r lectures/figures ./html

lecture1: lectures/lecture1.ipynb
	jupyter nbconvert --to slides lectures/lecture1.ipynb --template=cwi

lecture2: lectures/lecture2.ipynb
	jupyter nbconvert --to slides lectures/lecture2.ipynb --template=cwi

lecture3: lectures/lecture3.ipynb
	jupyter nbconvert --to slides lectures/lecture3.ipynb --template=cwi

index: index.md
	pandoc --standalone index.md --template=html/uikit.html -o html/index.html --toc --metadata title="UU Summerschool Mathematical Modeling - Computed Tomography"

website: html
	ghp-import -n -p -f html
	open https://tristanvanleeuwen.github.io/UUSummerschool24_Xray/index.html
	
