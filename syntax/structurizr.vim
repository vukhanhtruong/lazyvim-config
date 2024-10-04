" File: ~/.config/nvim/syntax/structurizr.vim
syntax keyword dslKeyword workspace model views
syntax keyword dslKeyword system container component relationship
syntax keyword dslKeyword tags description technology
highlight link dslKeyword Keyword

syntax match dslString /".*"/
highlight link dslString String

" Define comment syntax
syn match dslComment "#.*"
highlight link dslComment Comment
