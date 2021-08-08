#!/usr/bin/perl
$latex='pdflatex -kanji=utf8 -guess-input-enc -synctex=1 -interaction=nonstopmode %S';
$dvipdf='dvipdfmx -f ptex-ipaex.map %S';
$bibtex='pbibtex -kanji=utf8 %B';$pdf_mode = 3; # use dvipdf
# Prevent latexmk from removing PDF after typeset.
$pvc_view_file_via_temporary = 0;
