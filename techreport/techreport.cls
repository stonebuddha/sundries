\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{techreport}
\def\@classname{techreport}
\RequirePackage{xkeyval}
\RequirePackage{xstring}
\LoadClass[10pt,letterpaper]{article}
\RequirePackage{microtype}
\RequirePackage{etoolbox}
\RequirePackage{refcount}
\RequirePackage{totpages}
\RequirePackage{environ}
\RequirePackage{textcase}
\RequirePackage[square,numbers,sort&compress]{natbib}
\RequirePackage[bookmarksnumbered,unicode]{hyperref}
\pdfstringdefDisableCommands{%
  \def\unskip{}%
	\def\textbullet{- }%
	\def\textrightarrow{ -> }%
	\def\footnotemark{}%
}
\urlstyle{rm}
\AtEndPreamble{%
	\hypersetup{colorlinks,linkcolor=Red,citecolor=Purple,urlcolor=DarkBlue,filecolor=DarkBlue}%
}
\let\citeN\cite
\let\cite\citep
\let\citeANP\citeauthor
\let\citeNN\citeyearpar
\let\citeyearNP\citeyear
\let\citeNP\citealt
\DeclareRobustCommand\citeA{\begingroup\NAT@swafalse\let\NAT@ctype\@ne\NAT@partrue\NAT@fullfalse\NAT@open\NAT@citetp}
\providecommand\newblock{}
\RequirePackage{graphicx}
\RequirePackage[prologue]{xcolor}
\definecolor[named]{Blue}{cmyk}{1,0.1,0,0.1}
\definecolor[named]{Yellow}{cmyk}{0,0.16,1,0}
\definecolor[named]{Orange}{cmyk}{0,0.42,1,0.01}
\definecolor[named]{Red}{cmyk}{0,0.90,0.86,0}
\definecolor[named]{LightBlue}{cmyk}{0.49,0.01,0,0}
\definecolor[named]{Green}{cmyk}{0.20,0,1,0.19}
\definecolor[named]{Purple}{cmyk}{0.55,1,0,0.15}
\definecolor[named]{DarkBlue}{cmyk}{1,0.58,0,0.21}
\RequirePackage{geometry}
\geometry{twoside=false,includeheadfoot,head=13pt,foot=2pc,paperwidth=6.75in,paperheight=10in,top=58pt,bottom=44pt,inner=46pt,outer=46pt,marginparwidth=2pc,heightrounded}
\setlength\parindent{10\p@}
\setlength\parskip{\z@}
%\setlength\normalparindent{\parindent}
\RequirePackage{iftex}
\ifPDFTeX
\input{glyphtounicode}
\pdfglyphtounicode{f_f}{FB00}
\pdfglyphtounicode{f_f_i}{FB03}
\pdfglyphtounicode{f_f_l}{FB04}
\pdfglyphtounicode{f_i}{FB01}
\pdfglyphtounicode{t_t}{00740074}
\pdfglyphtounicode{f_t}{00660074}
\pdfglyphtounicode{T_h}{00540068}
\pdfgentounicode=1
\fi
\RequirePackage{cmap}
%\ifxetex
%	\RequirePackage[tt=false]{libertine}
%\else
%	\RequirePackage[tt=false,type1=true]{libertine}
%\fi
%\RequirePackage[varqu]{zi4}
%\RequirePackage[libertine]{newtxmath}
\RequirePackage[scaled=0.88]{beraserif}
\RequirePackage[scaled=0.85]{berasans}
\RequirePackage[scaled=0.84]{beramono}
\RequirePackage{mathpazo}
\linespread{1.05}
\RequirePackage[T1,small,euler-digits]{eulervm}
\ifxetex\else
	\RequirePackage[T1]{fontenc}
\fi
\RequirePackage{caption,float}
\captionsetup[table]{position=top}
\captionsetup{labelfont={bf},textfont={bf},labelsep=colon,margin=\z@}
\newdimen\@TR@labelwidth
\AtBeginDocument{%
  \setlength\labelsep{4pt}
  \setlength{\@TR@labelwidth}{6.5pt}

  %% First-level list: when beginning after the first line of an
  %% indented paragraph or ending before an indented paragraph, labels
  %% should not hang to the left of the preceding/following text.
  \setlength\leftmargini{\z@}
  \addtolength\leftmargini{\parindent}
  \addtolength\leftmargini{2\labelsep}
  \addtolength\leftmargini{\@TR@labelwidth}

  %% Second-level and higher lists.
  \setlength\leftmarginii{\z@}
  \addtolength\leftmarginii{0.5\labelsep}
  \addtolength\leftmarginii{\@TR@labelwidth}
  \setlength\leftmarginiii{\leftmarginii}
  \setlength\leftmarginiv{\leftmarginiii}
  \setlength\leftmarginv{\leftmarginiv}
  \setlength\leftmarginvi{\leftmarginv}
  \@listi}
\newskip\listisep
\listisep\smallskipamount
\def\@listI{\leftmargin\leftmargini
  \labelwidth\leftmargini \advance\labelwidth-\labelsep
  \listparindent\z@
  \topsep\listisep}
\let\@listi\@listI
\def\@listii{\leftmargin\leftmarginii
  \labelwidth\leftmarginii \advance\labelwidth-\labelsep
  \topsep\z@skip}
\def\@listiii{\leftmargin\leftmarginiii
  \labelwidth\leftmarginiii \advance\labelwidth-\labelsep}
\def\@listiv{\leftmargin\leftmarginiv
  \labelwidth\leftmarginiv \advance\labelwidth-\labelsep}
\def\@listv{\leftmargin\leftmarginv
  \labelwidth\leftmarginv \advance\labelwidth-\labelsep}
\def\@listvi{\leftmargin\leftmarginvi
  \labelwidth\leftmarginvi \advance\labelwidth-\labelsep}
\RequirePackage{fancyhdr}
\pagestyle{headings}
\RequirePackage{amsmath,amsfonts,amsthm}
\newtheoremstyle{trplain}%
	{.5\baselineskip\@plus.2\baselineskip\@minus.2\baselineskip}% space above
	{.5\baselineskip\@plus.2\baselineskip\@minus.2\baselineskip}% space below
	{\itshape}% body font
	{\z@}% indent amount
	{\bfseries}% head font
	{.}% punctuation after head
	{.5em}% spacing after head
	{\thmname{#1}\thmnumber{ #2}\thmnote{ {\normalfont(#3)}}}% head spec
\newtheoremstyle{trdefinition}%
	{.5\baselineskip\@plus.2\baselineskip\@minus.2\baselineskip}% space above
 	{.5\baselineskip\@plus.2\baselineskip\@minus.2\baselineskip}% space below
 	{\normalfont}% body font
 	{\z@}% indent amount
 	{\bfseries}% head font
 	{.}% punctuation after head
 	{.5em}% spacing after head
 	{\thmname{#1}\thmnumber{ #2}\thmnote{ {\normalfont(#3)}}}% head spec
 \newtheoremstyle{trremark}%
	{.5\baselineskip\@plus.2\baselineskip\@minus.2\baselineskip}% space above
 	{.5\baselineskip\@plus.2\baselineskip\@minus.2\baselineskip}% space below
 	{\normalfont}% body font
 	{\z@}% indent amount
 	{\itshape}% head font
 	{.}% punctuation after head
 	{.5em}% spacing after head
 	{\thmname{#1}\thmnumber{ #2}\thmnote{ {\normalfont(#3)}}}% head spec
\theoremstyle{trplain}
\AtEndPreamble{%
	\theoremstyle{trplain}
	\newtheorem{theorem}{Theorem}[section]
	\newtheorem{conjecture}[theorem]{Conjecture}
	\newtheorem{proposition}[theorem]{Proposition}
	\newtheorem{lemma}[theorem]{Lemma}
	\newtheorem{corollary}[theorem]{Corollary}
	\theoremstyle{trdefinition}
	\newtheorem{example}[theorem]{Example}
	\newtheorem{definition}[theorem]{Definition}
	\newtheorem{observation}[theorem]{Observation}
	\newtheorem{challenge}[theorem]{Challenge}
	\newtheorem{principle}[theorem]{Principle}
	\theoremstyle{trremark}
	\newtheorem{remark}[theorem]{Remark}
	\newtheorem{fact}[theorem]{Fact}
	\theoremstyle{trplain}
}
\def\@proofnamefont{\itshape}
\def\@proofindent{\noindent}
\renewenvironment{proof}[1][\proofname]{\par
	\pushQED{\qed}%
	\normalfont \topsep6\p@\@plus6\p@\relax
	\trivlist
	\item[\@proofindent\hskip\labelsep
		{\@proofnamefont #1\@addpunct{.}}]\ignorespaces
}{%
	\popQED\endtrivlist\@endpefalse
}
\RequirePackage{comment}
\specialcomment{acks}{%
  \begingroup
  \section*{Acknowledgments}
  \phantomsection\addcontentsline{toc}{section}{Acknowledgments}
}{%
  \endgroup
}
\numberwithin{equation}{section}

\RequirePackage{enumerate}
\RequirePackage{booktabs}
\RequirePackage{subcaption}
\RequirePackage{mathpartir}
\RequirePackage{turnstile}
\RequirePackage{mathtools}
\RequirePackage{mathrsfs}
\RequirePackage{stmaryrd}
\RequirePackage{relsize}
\RequirePackage{multirow}
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}
\RequirePackage{tikz}
\usetikzlibrary{shapes,arrows}
\RequirePackage[shortlabels]{enumitem}
\setlist{nosep,leftmargin=*}
\RequirePackage{nicefrac}
\RequirePackage{marginnote}
\RequirePackage{authblk}

\IfFileExists{refs.sty}{\RequirePackage{refs}}{}
\IfFileExists{shortcuts.sty}{\RequirePackage{shortcuts}}{}
