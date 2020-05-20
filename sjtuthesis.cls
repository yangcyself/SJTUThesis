%%
%% This is file `sjtuthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% sjtuthesis.dtx  (with options: `class')
%% 
%% Copyright (C) 2009-2017 by weijianwen <weijianwen@gmail.com>
%%           (C) 2018-2020 by SJTUG
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3c
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%     https://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%% 
%% This file has the LPPL maintenance status "maintained".
%% 
%% The Current Maintainer of this work is Alexara Wu.
%% 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sjtuthesis}
  [2019/06/16 1.0.0rc Shanghai Jiao Tong University Thesis Template]
\hyphenation{SJTU-Thesis}
\def\sjtuthesis{SJTU\textsc{Thesis}}
\def\version{1.0.0rc}
\RequirePackage{kvdefinekeys}
\RequirePackage{kvsetkeys}
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=sjtu,
  prefix=sjtu@,
  setkeys=\kvsetkeys}
\newcommand\sjtu@error[1]{%
  \ClassError{sjtuthesis}{#1}{}%
}
\newcommand\sjtusetup{%
  \kvsetkeys{sjtu}%
}
\newcommand\sjtu@define@key[2]{%
  \kvsetkeys{#1@key}{#2}%
}
\newcommand\sjtu@set@family@handler[1]{%
  \kv@set@family@handler{#1@key}{%
    \@namedef{#1@##1@@name}{##1}%
    \def\sjtu@@default{}%
    \def\sjtu@@choices{}%
    \kv@define@key{#1@value}{name}{%
      \@namedef{#1@##1@@name}{####1}%
    }%
    \kv@define@key{#1@value}{code}{%
      \@namedef{#1@##1@@code}{####1}%
    }%
    \@namedef{#1@##1@@check}{}%
    \@namedef{#1@##1@@code}{}%
    \@namedef{#1@##1@@hook}{%
      \expandafter\ifx\csname\@currname.\@currext-h@@k\endcsname\relax
        \@nameuse{#1@##1@@code}%
      \else
        \AtEndOfClass{%
          \@nameuse{#1@##1@@code}%
        }%
      \fi
    }%
    \kv@define@key{#1@value}{choices}{%
      \def\sjtu@@choices{####1}%
      \@namedef{#1@##1@@reset}{}%
      \@namedef{#1@##1@@check}{%
        \@ifundefined{%
          if#1@\@nameuse{#1@##1@@name}@\@nameuse{#1@\@nameuse{#1@##1@@name}}%
        }{%
          \sjtu@error{Invalid value "##1 = \@nameuse{#1@\@nameuse{#1@##1@@name}}"}%
        }%
        \@nameuse{#1@##1@@reset}%
        \@nameuse{#1@\@nameuse{#1@##1@@name}@\@nameuse{#1@\@nameuse{#1@##1@@name}}true}%
      }%
    }%
    \kv@define@key{#1@value}{default}{%
      \def\sjtu@@default{####1}%
    }%
    \kvsetkeys{#1@value}{##2}%
    \@namedef{#1@\@nameuse{#1@##1@@name}}{}%
    \kv@set@family@handler{#1@choice}{%
      \ifx\sjtu@@default\@empty
        \def\sjtu@@default{####1}%
      \fi
      \expandafter\newif\csname if#1@\@nameuse{#1@##1@@name}@####1\endcsname
      \expandafter\g@addto@macro\csname #1@##1@@reset\endcsname{%
        \@nameuse{#1@\@nameuse{#1@##1@@name}@####1false}%
      }%
    }%
    \kvsetkeys@expandafter{#1@choice}{\sjtu@@choices}%
    \expandafter\let\csname #1@\@nameuse{#1@##1@@name}\endcsname\sjtu@@default
    \expandafter\ifx\csname #1@\@nameuse{#1@##1@@name}\endcsname\@empty\else
      \@nameuse{#1@##1@@check}%
      \@nameuse{#1@##1@@hook}%
    \fi
    \kv@define@key{#1}{##1}{%
      \@namedef{#1@\@nameuse{#1@##1@@name}}{####1}%
      \@nameuse{#1@##1@@check}%
      \@nameuse{#1@##1@@hook}%
    }%
  }
}
\newcommand\sjtu@addto[2]{%
  \expandafter\g@addto@macro\csname sjtu@#1@@code\endcsname{#2}%
}
\newif\ifsjtu@degree@graduate
\newcommand\sjtu@set@graduate{%
  \sjtu@degree@graduatefalse
  \ifsjtu@degree@doctor
    \sjtu@degree@graduatetrue
  \fi
  \ifsjtu@degree@master
    \sjtu@degree@graduatetrue
  \fi
}
\sjtu@set@family@handler{sjtu}
\sjtu@define@key{sjtu}{
  degree = {
    choices = {
      doctor,
      master,
      bachelor,
      course,
    },
    default = doctor,
    code = {\sjtu@set@graduate},
  },
  language = {
    choices = {
      chinese,
      english,
    },
  },
  zihao = {
    choices = {
      -4,
      5,
    },
    default = 5,
  },
  latinfontset = {
    choices = {
      xits,
      times,
      none,
    },
  },
}
\DeclareBoolOption{review}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessKeyvalOptions*
\PassOptionsToPackage{no-math}{fontspec}
\PassOptionsToPackage{math-style=ISO}{unicode-math}
\LoadClass[a4paper,UTF8,scheme=plain,linespread=1.3,zihao=\sjtu@zihao]{ctexbook}
\AtEndOfClass{
  \ifsjtu@degree@graduate
    \input{sjtuthesis-graduate.ltx}
  \else
    \input{sjtuthesis-undergraduate.ltx}
  \fi
}
\RequirePackage{etoolbox}
\RequirePackage{xparse}
\RequirePackage{environ}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{pageslts}
\RequirePackage{amsmath}
\RequirePackage{unicode-math}
\RequirePackage{anyfontsize}
\RequirePackage{xeCJKfntef}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{caption}
\RequirePackage[list=off]{bicaption}
\RequirePackage{subcaption}
\RequirePackage[titles]{tocloft}
\RequirePackage[inline]{enumitem}
\RequirePackage[perpage, bottom]{footmisc}
\RequirePackage{pdfpages}
\includepdfset{fitpaper=true}
\RequirePackage{url}
\urlstyle{same}
\g@addto@macro\UrlBreaks{%
  \do0\do1\do2\do3\do4\do5\do6\do7\do8\do9%
  \do\A\do\B\do\C\do\D\do\E\do\F\do\G\do\H\do\I\do\J\do\K\do\L\do\M
  \do\N\do\O\do\P\do\Q\do\R\do\S\do\T\do\U\do\V\do\W\do\X\do\Y\do\Z
  \do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j\do\k\do\l\do\m
  \do\n\do\o\do\p\do\q\do\r\do\s\do\t\do\u\do\v\do\w\do\x\do\y\do\z
}
\Urlmuskip=0mu plus 0.1mu
\kv@define@key{sjtu}{format}{
  \kvsetkeys{sjtu@format}{#1}
}
\sjtu@set@family@handler{sjtu@format}
\sjtu@define@key{sjtu@format}{
  title-logo-color = {
    name = title@logo@color,
    choices = {
      red,
      blue,
      black,
    },
    default = blue,
  },
  header-logo-color = {
    name = header@logo@color,
    choices = {
      red,
      blue,
      black,
    },
    default = black,
  },
  float-numbering-separator = {
    name = fl@num@sep,
    default = {--},
  },
  equation-numbering-separator = {
    name = eq@num@sep,
    default = {--},
  },
}
\kv@define@key{sjtu}{info}{
  \kvsetkeys{sjtu@info}{#1}
}
\sjtu@set@family@handler{sjtu@info}
\sjtu@define@key{sjtu@info}{
  title,
  title*          = { name = title@en },
  keywords,
  keywords*       = { name = keywords@en },
  author,
  author*         = { name = author@en },
  id,
  supervisor,
  supervisor*     = { name = supervisor@en },
  assisupervisor,
  assisupervisor* = { name = assisupervisor@en },
  degree,
  degree*         = { name = degree@en },
  department,
  department*     = { name = department@en },
  major,
  major*          = { name = major@en },
  coursename,
  coursename*     = { name = coursename@en },
  fund,
  fund*           = { name = fund@en },
  date            = {%
    default = {\the\year-\two@digits{\month}-\two@digits{\day}},
  },
}
\newcommand\sjtu@date[2]{%
  \ifsjtu@review\relax\else
    \edef\sjtu@@date{#2}%
    \def\sjtu@@process@date##1-##2-##3\@nil{%
      #1{##1}{##2}{##3}%
    }%
    \expandafter\sjtu@@process@date\sjtu@@date\@nil
  \fi
}
\newcommand\sjtu@date@format[3]{#1 年 \number#2 月 \number#3 日}
\newcommand\sjtu@date@en@month[1]{%
  \ifcase\number#1\or
    January\or February\or March\or April\or May\or June\or
    July\or August\or September\or October\or November\or December%
  \fi
}
\newcommand\sjtu@date@format@en[3]{\sjtu@date@en@month{#2} #3, #1}
\newcommand\sjtu@clist@use[2]{%
  \def\sjtu@@tmp{}%
  \kv@set@family@handler{sjtu@clist}{%
    \ifx\sjtu@@tmp\@empty
      \def\sjtu@@tmp{#2}%
    \else
      #2%
    \fi
    ##1%
  }%
  \kvsetkeys@expandafter{sjtu@clist}{#1}%
}
\kv@define@key{sjtu}{name}{
  \kvsetkeys{sjtu@name}{#1}
}
\sjtu@set@family@handler{sjtu@name}
\sjtu@define@key{sjtu@name}{
  appendix          = { default = Appendix },
  contents          = { default = Contents },
  listfigure        = { default = List of Figures },
  listtable         = { default = List of Tables },
  listalgorithm     = { default = List of Algorithms },
  figure            = { default = Figure },
  figure*           = { name = figure@second, default = 图 },
  table             = { default = Table },
  table*            = { name = table@second, default = 表 },
  algorithm         = { default = Algorithm },
  nomenclature      = { default = Nomenclature },
  summary           = { default = Summary },
  bib               = { default = Bibliography },
  index             = { default = Index },
  acknowledgements  = { default = Acknowledgements },
  publications      = { default = Publications },
  achievements      = { default = Research Achievements },
  resume            = { default = Resume },
}
\newcommand{\sjtu@name@def}[2]{%
  \@namedef{sjtu@name@#1}{#2}
}
\sjtu@name@def{school@zh}{上海交通大学}
\sjtu@name@def{school@en}{Shanghai Jiao Tong University}
\sjtu@name@def{orig@subtitle@zh}{原创性声明}
\sjtu@name@def{orig@subtitle@en}{Declaration of Originality}
\sjtu@name@def{auth@subtitle@zh}{版权使用授权书}
\sjtu@name@def{auth@subtitle@en}{Declaration of Authorization}
\sjtu@name@def{orig@title}{\sjtu@name@thesis@kind\sjtu@name@orig@subtitle@zh}
\sjtu@name@def{auth@title}{\sjtu@name@thesis@kind\sjtu@name@auth@subtitle@zh}
\sjtu@name@def{origbody}{%
  本人郑重声明：所呈交的\sjtu@name@thesis@kind ，是本人在导师的指导下，
  独立进行研究工作所取得的成果。除文中已经注明引用的内容外，本论文不包含
  任何其他个人或集体已经发表或撰写过的作品成果。对本文的研究做出重要贡献
  的个人和集体，均已在文中以明确方式标明。本人完全意识到本声明的法律结果
  由本人承担。}
\sjtu@name@def{authbody}{%
  本\sjtu@name@thesis@kind 作者
  完全了解学校有关保留、使用\sjtu@name@thesis@kind 的规定，同意学校保留
  并向国家有关部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。
  本人授权\sjtu@name@school@zh 可以将本\sjtu@name@thesis@kind 的全部或
  部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存
  和汇编本\sjtu@name@thesis@kind 。}
\sjtu@name@def{abstract@zh}{摘\hspace{\ccwd}要}
\sjtu@name@def{abstract@en}{Abstract}
\sjtu@name@def{keywords@zh}{关键词：}
\sjtu@name@def{keywords@en}{Key words:~}
\ifsjtu@language@chinese
  \sjtusetup{
    name = {
      appendix          = {附录},
      contents          = {目\hspace{\ccwd}录},
      listfigure        = {插图索引},
      listtable         = {表格索引},
      listalgorithm     = {算法索引},
      figure            = {图},
      figure*           = {Figure},
      table             = {表},
      table*            = {Table},
      algorithm         = {算法},
      nomenclature      = {主要符号对照表},
      summary           = {全文总结},
      bib               = {参考文献},
      index             = {索\hspace{\ccwd}引},
      acknowledgements  = {致\hspace{\ccwd}谢},
      publications      = {攻读学位期间发表（或录用）的学术论文},
      achievements      = {攻读学位期间获得的科研成果},
      resume            = {个人简历},
    }
  }
  \ctexset{
    chapter/name = {第,章},
  }
  \sjtu@name@def{titlepage}{扉页}
  \let\sjtu@name@orig@subtitle\sjtu@name@orig@subtitle@zh
  \let\sjtu@name@auth@subtitle\sjtu@name@auth@subtitle@zh
  \let\sjtu@name@abstract\sjtu@name@abstract@zh
  \sjtu@name@def{assertion}{断言}
  \sjtu@name@def{assumption}{假设}
  \sjtu@name@def{axiom}{公理}
  \sjtu@name@def{corollary}{推论}
  \sjtu@name@def{definition}{定义}
  \sjtu@name@def{example}{例}
  \sjtu@name@def{lemma}{引理}
  \sjtu@name@def{proof}{证明}
  \sjtu@name@def{proposition}{命题}
  \sjtu@name@def{remark}{注}
  \sjtu@name@def{theorem}{定理}
\else
  \sjtu@name@def{titlepage}{Title Page}
  \let\sjtu@name@orig@subtitle\sjtu@name@orig@subtitle@en
  \let\sjtu@name@auth@subtitle\sjtu@name@auth@subtitle@en
  \let\sjtu@name@abstract\sjtu@name@abstract@en
  \sjtu@name@def{assertion}{Assertion}
  \sjtu@name@def{assumption}{Assumption}
  \sjtu@name@def{axiom}{Axiom}
  \sjtu@name@def{corollary}{Corollary}
  \sjtu@name@def{definition}{Definition}
  \sjtu@name@def{example}{Example}
  \sjtu@name@def{lemma}{Lemma}
  \sjtu@name@def{proof}{Proof}
  \sjtu@name@def{proposition}{Proposition}
  \sjtu@name@def{remark}{Remark}
  \sjtu@name@def{theorem}{Theorem}
\fi
\ctexset{%
  appendixname   = \sjtu@name@appendix,
  contentsname   = \sjtu@name@contents,
  listfigurename = \sjtu@name@listfigure,
  listtablename  = \sjtu@name@listtable,
  figurename     = \sjtu@name@figure,
  tablename      = \sjtu@name@table,
  bibname        = \sjtu@name@bib,
  indexname      = \sjtu@name@index,
}
\newif\ifsjtu@xitsnew
\@ifpackagelater{fontspec}{2017/01/20}{
  \IfFontExistsTF{XITSMath-Regular.otf}{
    \sjtu@xitsnewtrue
  }{}
}{}
\ifsjtu@latinfontset@xits
  \ifsjtu@xitsnew
    \setmainfont{XITS}[
      Extension          = .otf,
      UprightFont        = *-Regular,
      BoldFont           = *-Bold,
      ItalicFont         = *-Italic,
      BoldItalicFont     = *-BoldItalic,
      UprightFeatures    = { SmallCapsFont = texgyretermes-regular },
      BoldFeatures       = { SmallCapsFont = texgyretermes-bold },
      ItalicFeatures     = { SmallCapsFont = texgyretermes-italic },
      BoldItalicFeatures = { SmallCapsFont = texgyretermes-bolditalic },
      SmallCapsFeatures  = { Letters = SmallCaps }
    ]
  \else
    \setmainfont{xits}[
      Extension          = .otf,
      UprightFont        = *-regular,
      BoldFont           = *-bold,
      ItalicFont         = *-italic,
      BoldItalicFont     = *-bolditalic,
      UprightFeatures    = { SmallCapsFont = texgyretermes-regular },
      BoldFeatures       = { SmallCapsFont = texgyretermes-bold },
      ItalicFeatures     = { SmallCapsFont = texgyretermes-italic },
      BoldItalicFeatures = { SmallCapsFont = texgyretermes-bolditalic },
      SmallCapsFeatures  = { Letters = SmallCaps }
    ]
  \fi
  \RequirePackage[opentype,scaled=.9]{sourcesanspro}
  \RequirePackage[opentype,scaled=.9]{sourcecodepro}
\fi
\unimathsetup{
  math-style = ISO,
  bold-style = ISO,
  nabla      = upright,
  partial    = upright,
}
\ifsjtu@xitsnew
  \setmathfont{XITSMath-Regular}[
    Extension    = .otf,
    BoldFont     = XITSMath-Bold,
    StylisticSet = 8
  ]
  \setmathfont{XITSMath-Regular.otf}[range={cal,bfcal},StylisticSet=1]
  \else
  \setmathfont{xits-math}[
    Extension    = .otf,
    BoldFont     = *bold,
    StylisticSet = 8
  ]
  \setmathfont{xits-math.otf}[range={cal,bfcal},StylisticSet=1]
\fi
\patchcmd\cleardoublepage%
  {\newpage}{\thispagestyle{empty}\newpage}
  {}{}
\patchcmd\chapter%
  {\thispagestyle{\CTEX@chapter@pagestyle}}{}
  {}{}
\AtBeginDocument{%
  \pagenumbering{Alph}
  \pagestyle{empty}}
\renewcommand{\frontmatter}{%
  \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{Roman}
  \def\sjtu@thepage{\thepage}
  \def\sjtu@lastpageref{\lastpageref{pagesLTS.Roman}}
  \pagestyle{sjtu@plain}
}
\renewcommand{\mainmatter}{%
  \cleardoublepage
  \@mainmattertrue
  \sjtu@setfloatfonttrue
  \pagenumbering{arabic}
  \def\sjtu@lastpageref{\lastpageref{pagesLTS.arabic}}
}
\renewcommand{\backmatter}{%
  \cleardoublepage
  \@mainmatterfalse
}
\ctexset{%
  chapter={%
    format       = \zihao{3}\bfseries\heiti\centering,
    nameformat   = {},
    titleformat  = {},
    aftername    = \quad,
    afterindent  = true,
    beforeskip   = 1ex,
    afterskip    = 2ex
  },
  section={%
    format       = \zihao{4}\bfseries\heiti,
    afterindent  = true,
    afterskip    = 1ex \@plus .2ex
  },
  subsection={%
    format       = \zihao{-4}\bfseries\heiti,
    afterindent  = true,
    afterskip    = 1ex \@plus .2ex
  },
  subsubsection={%
    format       = \zihao{-4}\normalfont,
    afterindent  = true,
    afterskip    = 1ex \@plus .2ex
  },
  paragraph/afterindent    = true,
  subparagraph/afterindent = true}
\ctexset{%
  punct          = quanjiao,
  space          = auto,
  autoindent     = true}
\AtEndOfClass{\sloppy}
\setlist{nosep}
\setlist*{leftmargin=*}
\setlist[1]{labelindent=\parindent}
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}
\renewcommand{\tableofcontents}{%
  \cleardoublepage%
  \pdfbookmark[0]{\contentsname}{toc}%
  \chapter*{\contentsname}%
  \@mkboth{\contentsname}{\contentsname}%
  \@starttoc{toc}
}
\renewcommand{\listoffigures}{%
  \cleardoublepage%
  \pdfbookmark[0]{\listfigurename}{lof}%
  \chapter*{\listfigurename}%
  \@mkboth{\listfigurename}{\listfigurename}%
  \@starttoc{lof}
}
\renewcommand{\listoftables}{%
  \cleardoublepage%
  \pdfbookmark[0]{\listtablename}{lot}%
  \chapter*{\listtablename}%
  \@mkboth{\listtablename}{\listtablename}%
  \@starttoc{lot}
}
\renewcommand{\cftfigpresnum}{\sjtu@name@figure~}
\renewcommand{\cfttabpresnum}{\sjtu@name@table~}
\AtEndPreamble{%
  \newlength{\sjtu@cftfignumwidth@tmp}
    \settowidth{\sjtu@cftfignumwidth@tmp}{\cftfigpresnum}
  \addtolength{\cftfignumwidth}{\sjtu@cftfignumwidth@tmp}
  \newlength{\sjtu@cfttabnumwidth@tmp}
    \settowidth{\sjtu@cfttabnumwidth@tmp}{\cfttabpresnum}
  \addtolength{\cfttabnumwidth}{\sjtu@cfttabnumwidth@tmp}
}
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}
\AtBeginDocument{%
  \renewcommand{\thefigure}{\thechapter\sjtu@format@fl@num@sep\arabic{figure}}
  \renewcommand{\p@subfigure}{\thefigure}
  \renewcommand{\thetable}{\thechapter\sjtu@format@fl@num@sep\arabic{table}}
  \renewcommand{\theequation}{\thechapter\sjtu@format@eq@num@sep\arabic{equation}}
}
\newif\ifsjtu@setfloatfont
\renewcommand{\@floatboxreset}{%
  \reset@font
  \ifsjtu@setfloatfont
    \zihao{5}
  \else
    \normalsize
  \fi
  \@setminipage
}
\BeforeBeginEnvironment{longtable}
  {\begingroup\ifsjtu@setfloatfont\zihao{5}\fi}
\AfterEndEnvironment{longtable}
  {\endgroup}
\NewDocumentCommand{\sjtuSetFloatFontOn}{}{\sjtu@setfloatfonttrue}
\NewDocumentCommand{\sjtuSetFloatFontOff}{}{\sjtu@setfloatfontfalse}
\DeclareCaptionFont{sjtu@caption@font}{\zihao{5}\kaishu}
\DeclareCaptionFont{sjtu@subcaption@font}{\zihao{5}\normalfont}
\captionsetup{%
  format        = plain,
  labelformat   = simple,
  labelsep      = space,
  justification = centering,
  font          = sjtu@caption@font
}
\captionsetup[sub]{%
  format        = hang,
  labelformat   = brace,
  justification = justified,
  font          = sjtu@subcaption@font
}
\DeclareCaptionOption{bi-first}[]{%
  \def\tablename{\sjtu@name@table}
  \def\figurename{\sjtu@name@figure}}
\DeclareCaptionOption{bi-second}[]{%
  \def\tablename{\sjtu@name@table@second}
  \def\figurename{\sjtu@name@figure@second}}
\captionsetup[bi-first]{bi-first}
\captionsetup[bi-second]{bi-second}
\let\mathellipsis\cdots
\AtBeginDocument{%
  \renewcommand{\Re}{\operatorname{Re}}%
  \renewcommand{\Im}{\operatorname{Im}}%
}
\newcommand\upe{\mathrm{e}}
\newcommand\upi{\mathrm{i}}
\newcommand\upj{\mathrm{j}}
\newcommand\dif{\mathop{}\!\mathrm{d}}
\newcommand\bm{\symbf}
\renewcommand\boldsymbol{\symbf}
\newcommand\square{\mdlgwhtsquare}
\newcommand{\sjtu@square}{%
  \begingroup\CJKfamily+{zhsong}\symbol{"25A1}\endgroup
}
\newcommand{\sjtu@authconf}{%
  \par\hspace{7em}%
  {\heiti 保\quad 密}~\sjtu@square，在 \uline{\hspace{3em}}
  年解密后适用本授权书。\par
  本\sjtu@name@thesis@type 属于
  \par\hspace{7em}%
  {\heiti 不保密}~\sjtu@square。
  \vskip 1ex
  （请在以上方框内打“$\checkmark$”）
}
\newcommand{\sjtu@signbox}[1]{%
  \parbox{.45\textwidth}{%
    #1 签名： \vskip 4em%
    日期： \hspace{\stretch{3}} 年%
    \hspace{\stretch{2}} 月 \hspace{\stretch{2}} 日%
  }
}
\NewDocumentCommand{\makeorigpage}{o}{%
  \ifsjtu@review\relax\else
    \cleardoublepage
    \pdfbookmark[0]{\sjtu@name@orig@subtitle}{origtitle}
    \IfNoValueTF{#1}{%
      \thispagestyle{empty}
      \chapter*{\zihao{-2}\sjtu@name@school@zh \\%
                \sjtu@name@orig@title}
      \begingroup
        \zihao{4}
        \sjtu@name@origbody
        \vskip 16ex
        \noindent
        \begin{minipage}{\textwidth}
          \hfill
          \sjtu@signbox{\sjtu@name@thesis@type 作者}
        \end{minipage}
      \endgroup
    }
    {\includepdf[pagecommand={\thispagestyle{empty}}]{#1}}
    \cleardoublepage
  \fi
}
\NewDocumentCommand{\makeauthpage}{o}{%
  \ifsjtu@review\relax\else
    \cleardoublepage
    \pdfbookmark[0]{\sjtu@name@auth@subtitle}{authtitle}
    \IfNoValueTF{#1}{%
      \thispagestyle{empty}
      \chapter*{\zihao{-2}\sjtu@name@school@zh \\%
                \sjtu@name@auth@title}
      \begingroup
        \zihao{4}
        \sjtu@name@authbody
        \vskip 1ex
        \sjtu@authconf
        \vskip 16ex
        \noindent
        \begin{minipage}{\textwidth}
          \sjtu@signbox{\sjtu@name@thesis@type 作者}
          \hfill
          \sjtu@signbox{指导教师}
        \end{minipage}
      \endgroup
    }
    {\includepdf[pagecommand={\thispagestyle{empty}}]{#1}}
    \cleardoublepage
  \fi
}
\NewDocumentEnvironment{nomenclature}{}{%
  \cleardoublepage
  \pdfbookmark[0]{\sjtu@name@nomenclature}{nomenclature}
  \chapter*{\sjtu@name@nomenclature}
  \@mkboth{\sjtu@name@nomenclature}%
          {\sjtu@name@nomenclature}%
}{}
\NewDocumentEnvironment{summary}{}{%
  \cleardoublepage
  \chapter*{\sjtu@name@summary}
  \@mkboth{\sjtu@name@summary}%
          {\sjtu@name@summary}%
  \addcontentsline{toc}{chapter}{\sjtu@name@summary}%
}{}
\newcommand{\sjtu@acknowledgements}[1]{\long\gdef\sjtu@acknowledgements@body{#1}}
\NewDocumentEnvironment{acknowledgements}{}{%
  \Collect@Body\sjtu@acknowledgements
}{%
  \ifsjtu@review\relax\else
    \cleardoublepage
    \chapter*{\sjtu@name@acknowledgements}
    \@mkboth{\sjtu@name@acknowledgements}%
            {\sjtu@name@acknowledgements}%
    \addcontentsline{toc}{chapter}{\sjtu@name@acknowledgements}%
    \sjtu@acknowledgements@body
  \fi
}
\newenvironment{sjtu@bibliolist}[2]{%
  \cleardoublepage
  \chapter{#2}
  \@mkboth{#2}{#2}%
  \list{\@biblabel{\@arabic\c@enumiv}}%
       {\settowidth\labelwidth{\@biblabel{#1}}%
        \leftmargin\labelwidth
        \advance\leftmargin\labelsep
        \@openbib@code
        \usecounter{enumiv}%
        \let\p@enumiv\@empty
        \renewcommand\theenumiv{\@arabic\c@enumiv}}%
  \sloppy
  \clubpenalty4000
  \@clubpenalty \clubpenalty
  \widowpenalty4000%
  \sfcode`\.\@m
}{%
  \def\@noitemerr
    {\@latex@warning{Empty `bibliolist' environment}}%
  \endlist
}
\newcommand{\sjtu@publications}[1]{\long\gdef\sjtu@publications@body{#1}}
\NewDocumentEnvironment{publications}{O{99}}{%
  \Collect@Body\sjtu@publications
}{%
  \ifsjtu@review\relax\else
    \begin{sjtu@bibliolist}{#1}{\sjtu@name@publications}
      \sjtu@publications@body
    \end{sjtu@bibliolist}
  \fi
}
\newcommand{\sjtu@@publications}[1]{\long\gdef\sjtu@@publications@body{#1}}
\NewDocumentEnvironment{publications*}{O{99}}{%
  \Collect@Body\sjtu@@publications
}{%
  \ifsjtu@review
    \begin{sjtu@bibliolist}{#1}{\sjtu@name@publications}
      \sjtu@@publications@body
    \end{sjtu@bibliolist}
  \fi
}
\newcommand{\sjtu@achievements}[1]{\long\gdef\sjtu@achievements@body{#1}}
\NewDocumentEnvironment{achievements}{O{99}}{%
  \Collect@Body\sjtu@achievements
}{%
  \ifsjtu@review\relax\else
    \begin{sjtu@bibliolist}{#1}{\sjtu@name@achievements}
      \sjtu@achievements@body
    \end{sjtu@bibliolist}
  \fi
}
\newcommand{\sjtu@@achievements}[1]{\long\gdef\sjtu@@achievements@body{#1}}
\NewDocumentEnvironment{achievements*}{O{99}}{%
  \Collect@Body\sjtu@@achievements
}{%
  \ifsjtu@review
    \begin{sjtu@bibliolist}{#1}{\sjtu@name@achievements}
      \sjtu@@achievements@body
    \end{sjtu@bibliolist}
  \fi
}
\newcommand{\sjtu@resume}[1]{\long\gdef\sjtu@resume@body{#1}}
\NewDocumentEnvironment{resume}{}{%
  \Collect@Body\sjtu@resume
}{%
  \ifsjtu@review\relax\else
    \cleardoublepage
    \chapter{\sjtu@name@resume}
    \@mkboth{\sjtu@name@resume}%
            {\sjtu@name@resume}%
    \sjtu@resume@body
  \fi
}
\AtEndPreamble{
  \ifsjtu@review%
    \sjtusetup{%
      info = {
        author          = {},
        author*         = {},
        id              = {},
        supervisor      = {},
        supervisor*     = {},
        assisupervisor  = {},
        assisupervisor* = {},
      }
    }
  \fi
}
\NewDocumentCommand{\encrypt}{m O{***}}{%
  \ifsjtu@review
    {#2}
  \else
    {#1}
  \fi
}
\newcommand{\sjtu@uline}[1]{%
  \begingroup
    \setbox0=\vbox{\strut #1\strut}%
    \dimen0=0pt
    \loop\ifdim\ht0>0pt
      \dimen1=\dimexpr\ht0 - \baselineskip\relax
      \setbox1=\vsplit0 to \ht\strutbox
      \advance\dimen1 by -\ht0
      \noindent\raisebox{-\dimen0}[\ht\strutbox][\dp\strutbox]{\box1}%
      \advance\dimen0 by \dimen1
      \vspace{-0.2ex}\hrule\vskip 0.2ex
    \repeat
  \endgroup
}
\newcommand{\sjtu@atendpackage}{\csname ctex_at_end_package:nn\endcsname}
\sjtu@atendpackage{hyperref}{
  \hypersetup{
    linktoc            = all,
    bookmarksdepth     = 2,
    bookmarksnumbered  = true,
    bookmarksopen      = true,
    bookmarksopenlevel = 1,
    unicode            = true,
    psdextra           = true,
    breaklinks         = true,
    plainpages         = false,
    pdfdisplaydoctitle = true,
    hidelinks,
  }
  \pdfstringdefDisableCommands{%
    \let\\\@empty
    \let\hspace\@gobble
  }
  \@ifpackagelater{hyperref}{2019/04/27}{}{%
    \g@addto@macro\psdmapshortnames{\let\mu\textmu}
  }%
  \AtBeginDocument{%
    \ifsjtu@language@chinese
      \hypersetup{
        pdftitle    = \sjtu@info@title,
        pdfauthor   = \sjtu@info@author,
        pdfsubject  = \sjtu@name@subject@zh,
        pdfkeywords = \sjtu@info@keywords,
        pdflang     = zh-CN,
      }%
    \else
      \hypersetup{
        pdftitle    = \sjtu@info@title@en,
        pdfauthor   = \sjtu@info@author@en,
        pdfsubject  = \sjtu@name@subject@en,
        pdfkeywords = \sjtu@info@keywords@en,
        pdflang     = en-US,
      }%
    \fi
    \hypersetup{
      pdfcreator  = {LaTeX with SJTUThesis \version}
    }
  }%
}
\sjtu@atendpackage{threeparttable}{
  \appto\TPTnoteSettings{\footnotesize}
}
\sjtu@atendpackage{siunitx}{
  \sisetup{
    detect-all,
    group-minimum-digits = 4,
    separate-uncertainty = true,
    inter-unit-product   = \ensuremath{{}\cdot{}},
  }
  \ifsjtu@language@chinese
    \sisetup{
      list-final-separator = { 和 },
      list-pair-separator  = { 和 },
      range-phrase         = {～},
    }
  \fi
}
\PassOptionsToPackage{amsmath,thmmarks,hyperref}{ntheorem}
\sjtu@atendpackage{ntheorem}{
  \theoremheaderfont{\bfseries\heiti}
  \theorembodyfont{\normalfont}
  \theoremseparator{\enskip}
  \theoremsymbol{\ensuremath{\square}}
  \newtheorem*{proof}{\sjtu@name@proof}
  \theoremstyle{plain}
  \theoremsymbol{}
  \newtheorem{theorem}             {\sjtu@name@theorem}    [chapter]
  \newtheorem{assertion}  [theorem]{\sjtu@name@assertion}
  \newtheorem{axiom}      [theorem]{\sjtu@name@axiom}
  \newtheorem{corollary}  [theorem]{\sjtu@name@corollary}
  \newtheorem{lemma}      [theorem]{\sjtu@name@lemma}
  \newtheorem{proposition}[theorem]{\sjtu@name@proposition}
  \newtheorem{assumption}          {\sjtu@name@assumption} [chapter]
  \newtheorem{definition}          {\sjtu@name@definition} [chapter]
  \newtheorem{example}             {\sjtu@name@example}    [chapter]
  \newtheorem*{remark}             {\sjtu@name@remark}
}
\sjtu@atendpackage{amsthm}{
  \newtheoremstyle{sjtuplain}
    {}{}
    {\normalfont}{}
    {\bfseries\heiti}{}
    {\ccwd}{}
  \theoremstyle{sjtuplain}
  \newtheorem{theorem}             {\sjtu@name@theorem}    [chapter]
  \newtheorem{assertion}  [theorem]{\sjtu@name@assertion}
  \newtheorem{axiom}      [theorem]{\sjtu@name@axiom}
  \newtheorem{corollary}  [theorem]{\sjtu@name@corollary}
  \newtheorem{lemma}      [theorem]{\sjtu@name@lemma}
  \newtheorem{proposition}[theorem]{\sjtu@name@proposition}
  \newtheorem{assumption}          {\sjtu@name@assumption} [chapter]
  \newtheorem{definition}          {\sjtu@name@definition} [chapter]
  \newtheorem{example}             {\sjtu@name@example}    [chapter]
  \newtheorem*{remark}             {\sjtu@name@remark}
  \renewcommand\proofname\sjtu@name@proof
  \renewenvironment{proof}[1][\proofname]{\par
    \pushQED{\qed}%
    \normalfont \topsep6\p@\@plus6\p@\relax
    \trivlist
    \item\relax
      {\bfseries\heiti #1~}
      \hspace\labelsep\ignorespaces
  }{%
    \popQED\endtrivlist\@endpefalse
  }
}
\PassOptionsToPackage{algochapter}{algorithm2e}
\sjtu@atendpackage{algorithm2e}{
  \SetAlgorithmName{\sjtu@name@algorithm}%
                   {\sjtu@name@algorithm}%
                   {\sjtu@name@listalgorithm}
  \SetAlgoCaptionSeparator{~}
  \newcommand{\cftalgpresnum}{\sjtu@name@algorithm~}
  \AtEndPreamble{%
    \newlength{\cftalgindent}
      \setlength{\cftalgindent}{1.5em}
    \newlength{\cftalgnumwidth}
      \setlength{\cftalgnumwidth}{2.3em}
    \newlength{\sjtu@cftalgnumwidth@tmp}
      \settowidth{\sjtu@cftalgnumwidth@tmp}{\cftalgpresnum}
    \addtolength{\cftalgnumwidth}{\sjtu@cftalgnumwidth@tmp}
  }
  \renewcommand*{\l@algocf}{%
    \let\@cftbsnum \cftalgpresnum
    \@dottedtocline{1}{\cftalgindent}{\cftalgnumwidth}
  }
  \renewcommand{\listofalgorithms}{%
    \cleardoublepage%
    \pdfbookmark[0]{\listalgorithmcfname}{loa}%
    \chapter*{\listalgorithmcfname}%
    \@mkboth{\listalgorithmcfname}{\listalgorithmcfname}%
    \@starttoc{loa}
  }
  \AtBeginDocument{%
   \renewcommand{\thealgocf}{\thechapter--\@arabic\c@algocf}
  }
}
\sjtu@atendpackage{algorithm}{
  \RequirePackage{algorithmicx, algpseudocode}
  \floatname{algorithm}{\sjtu@name@algorithm}
  \@addtoreset{algorithm}{chapter}
  \patchcmd\@chapter%
    {\if@twocolumn}
    {\addtocontents{loa}{\protect\addvspace{10\p@}}%
      \if@twocolumn}
    {}{}
  \renewcommand{\listalgorithmname}{\sjtu@name@listalgorithm}
  \newcommand{\cftalgpresnum}{\sjtu@name@algorithm~}
  \AtEndPreamble{%
    \newlength{\cftalgindent}
      \setlength{\cftalgindent}{1.5em}
    \newlength{\cftalgnumwidth}
      \setlength{\cftalgnumwidth}{2.3em}
    \newlength{\sjtu@cftalgnumwidth@tmp}
      \settowidth{\sjtu@cftalgnumwidth@tmp}{\cftalgpresnum}
    \addtolength{\cftalgnumwidth}{\sjtu@cftalgnumwidth@tmp}
  }
  \newcommand*{\l@algorithm}{%
    \let\@cftbsnum \cftalgpresnum
    \@dottedtocline{1}{\cftalgindent}{\cftalgnumwidth}
  }
  \renewcommand{\listofalgorithms}{%
    \cleardoublepage%
    \pdfbookmark[0]{\listalgorithmname}{loa}%
    \chapter*{\listalgorithmname}%
    \@mkboth{\listalgorithmname}{\listalgorithmname}%
    \@starttoc{loa}
  }
  \AtBeginDocument{%
    \renewcommand{\thealgorithm}{\thechapter--\arabic{algorithm}}
  }
}
\sjtu@atendpackage{listings}{
  \lstdefinestyle{lstStyleCode}{
    aboveskip=\medskipamount,
    belowskip=\medskipamount,
    basicstyle=\footnotesize\ttfamily,
    commentstyle=\slshape\color{black!60},
    stringstyle=\color{green!40!black!100},
    keywordstyle=\bfseries\color{blue!50!black},
    extendedchars=false,
    upquote=true,
    tabsize=2,
    showstringspaces=false,
    xleftmargin=1em,
    xrightmargin=1em,
    breaklines=true,
    breakindent=2em,
    framexleftmargin=1em,
    framexrightmargin=1em,
    backgroundcolor=\color{gray!10},
    columns=flexible,
    keepspaces=true,
    texcl=true,
    mathescape=true
  }
}
\sjtu@atendpackage{tikz}{
  \usetikzlibrary{shapes.geometric, arrows}
  \tikzstyle{startstop} = [
    rectangle,
    rounded corners,
    minimum width=2cm,
    minimum height=1cm,
    text centered,
    draw=black
  ]
  \tikzstyle{io} = [
    trapezium,
    trapezium left angle=75,
    trapezium right angle=105,
    minimum width=1cm,
    minimum height=1cm,
    text centered,
    draw=black
  ]
  \tikzstyle{process} = [
    rectangle,
    minimum width=2cm,
    minimum height=1cm,
    text centered,
    draw=black
  ]
  \tikzstyle{decision} = [
    diamond,
    minimum width=2cm,
    minimum height=1cm,
    text centered,
    draw=black]
  \tikzstyle{arrow} = [thick, ->, >=stealth]
}
\endinput
%%
%% End of file `sjtuthesis.cls'.
