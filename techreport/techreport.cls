\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{techreport}
\def\@classname{techreport}
\RequirePackage{xkeyval}
\RequirePackage{xstring}
\LoadClass[10pt,reqno]{amsart}
\RequirePackage{microtype}
\RequirePackage{etoolbox}
\RequirePackage{refcount}
\RequirePackage{totpages}
\RequirePackage{environ}
\RequirePackage{textcase}
\RequirePackage[square,numbers,sort&compress]{natbib}
\let\citeN\cite
\let\cite\citep
\let\citeANP\citeauthor
\let\citeNN\citeyearpar
\let\citeyearNP\citeyear
\let\citeNP\citealt
\RequirePackage[bookmarksnumbered,unicode]{hyperref}
\pdfstringdefDisableCommands{%
	\def\unskip{}%
	\def\textbullet{- }%
	\def\textrightarrow{ -> }%
	\def\footnotemark{}%
}
\urlstyle{sf}
\AtEndPreamble{%
	\hypersetup{colorlinks,linkcolor=ACMRed,citecolor=ACMPurple,urlcolor=ACMDarkBlue,filecolor=ACMDarkBlue}%
}
\RequirePackage{graphicx}
\RequirePackage[prologue]{xcolor}
\definecolor[named]{ACMBlue}{cmyk}{1,0.1,0,0.1}
\definecolor[named]{ACMYellow}{cmyk}{0,0.16,1,0}
\definecolor[named]{ACMOrange}{cmyk}{0,0.42,1,0.01}
\definecolor[named]{ACMRed}{cmyk}{0,0.90,0.86,0}
\definecolor[named]{ACMLightBlue}{cmyk}{0.49,0.01,0,0}
\definecolor[named]{ACMGreen}{cmyk}{0.20,0,1,0.19}
\definecolor[named]{ACMPurple}{cmyk}{0.55,1,0,0.15}
\definecolor[named]{ACMDarkBlue}{cmyk}{1,0.58,0,0.21}
\RequirePackage{geometry}
\geometry{twoside=true,includeheadfoot,head=13pt,foot=2pc,paperwidth=6.75in,paperheight=10in,top=58pt,bottom=44pt,inner=46pt,outer=46pt,marginparwidth=2pc,heightrounded}
\setlength\parindent{10\p@}
\setlength\parskip{\z@}
\setlength\normalparindent{\parindent}
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
\RequirePackage[T1,small,euler-digits]{eulervm}
\ifxetex\else
	\RequirePackage[T1]{fontenc}
\fi
\RequirePackage{caption,float}
\captionsetup[table]{position=top}
\captionsetup{labelfont={bf},textfont={bf},labelsep=colon,margin=\z@}
\RequirePackage{fancyhdr}
\pagestyle{plain}
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
\RequirePackage{enumitem}
\setlist{nosep,leftmargin=*}

\IfFileExists{refs.sty}{\RequirePackage{refs}}{}
\IfFileExists{shortcuts.sty}{\RequirePackage{shortcuts}}{}