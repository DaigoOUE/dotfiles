## markdown on vim
remember, in order to preview mathjax in a markdown file with [kannokanno/previm](https://github.com/previm/previm), we should insert 
```
<script src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-MML-AM_CHTML' async></script>
```
>
in the head of `~/.cache/dein/repos/github.com/kannokanno/previm/preview/_/index.html`,  
and insert 
```
if (needReload && (typeof getContent === 'function') && (typeof getFileType === 'function')) {
var beforePageYOffset = _win.pageYOffset;
_doc.getElementById('preview').innerHTML = transform(getFileType(), getContent());
mermaid.init();
Array.prototype.forEach.call(_doc.querySelectorAll('pre code'), hljs.highlightBlock);
autoScroll('body', beforePageYOffset);
style_header();
>
/* Mathjax Start */
MathJax.Hub.Config({ tex2jax: { inlineMath: [['$','$'], ["\\(","\\)"]] } }); // added1
MathJax.Hub.Queue(["Typeset",MathJax.Hub]);  //added2
autoScroll('body');
/* Mathjax End */
}
```
in the `function loadPreview()` which is located at `~/.cache/dein/repos/github.com/kannokanno/previm/preview/_/js/previm.js`
>
remind also that we should execute `:call dein#recache_runtimepath()` to clear the cache (if you use dein)
