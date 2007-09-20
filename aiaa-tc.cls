%%
% AIAA class for technical conference papers.
%  by Bil Kleb and Bill Wood
%
% TODO:
% - item

\NeedsTeXFormat{LaTeX2e}[1994/12/01]

\ProvidesClass{aiaa-tc}[2007/09/18 v4.0.0 AIAA technical conference paper]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}%
                \typeout{Unknown option: passing ``\CurrentOption"
                         option on to the underlying LaTeX article class.}}
\ProcessOptions

\LoadClass[letterpaper,twoside,10pt]{article}

%%
% page layout

\RequirePackage[margin=1in,top=0.75in,headheight=\baselineskip]{geometry}

%%
% accommodate images

\RequirePackage{graphicx}

% defaults
\setkeys{Gin}{ width=\linewidth, totalheight=\textheight, keepaspectratio }

\RequirePackage{overcite}% superscript, sorted, compressed citation commands

\RequirePackage{lastpage}% to get reference for last page number

\RequirePackage{fancyhdr}% simple control of headers and footers

\newcommand*{\AIAApapernumber}[1]{\def\aiaa@papernumber{#1}}\AIAApapernumber{}
\newcommand*{\AIAAconference}[1]{\def\aiaa@conference{#1}}\AIAAconference{}
\newcommand*{\AIAAcopyright}[1]{\def\aiaa@copyright{#1}}\AIAAcopyright{}
\newcommand*{\AIAAsubmitinfo}[1]{\def\aiaa@submitinfo{#1}}\AIAAsubmitinfo{}

\setlength{\intextsep}{0.7\baselineskip \@plus 2\p@ \@minus 1\p@}

\def\fps@figure{htbp}
\def\fps@table{htbp}

\newcommand{\AIAAcopyrightA}[1]{Copyright \copyright\ #1 by the
  American Institute of Aeronautics and Astronautics, Inc. All
  rights reserved.}% rev 01/01/2002
\newcommand{\AIAAcopyrightB}[2]{Copyright \copyright\ #1 by
  #2. Published by the American Institute of Aeronautics
  and Astronautics, Inc.\ with permission.}% rev 01/01/2002
\newcommand{\AIAAcopyrightC}{This material is declared a work of the U.S.
  Government and is not subject to copyright protection in the
  United States.}% rev 01/01/2002
\newcommand{\AIAAcopyrightD}[1]{Copyright \copyright\ #1 by the American
  Institute of Aeronautics and Astronautics, Inc.  The U.S. Government
  has a royalty-free license to exercise all rights under the copyright
  claimed herein for Governmental purposes. All other rights are
  reserved by the copyright owner.}% rev 01/01/2002
\newcommand{\AIAAcopyrightDAPL}[1]{Copyright \copyright\ #1 by the American
  Institute of Aeronautics and Astronautics, Inc.  Under the copyright
  claimed herein, the U.S. Government has a royalty-free license to
  exercise all rights for Governmental purposes. All other rights are
  reserved by the copyright owner.}% rev 01/01/2002

\newcommand\aiaa@makecopyright{%
  \begingroup
   \renewcommand\thefootnote{}
  \endgroup
}

\newcounter{aiaa@cthanks}

\newcounter{aiaa@cfootnote}

\newcommand{\thanksibid}[1]{%
  \begingroup
    \setcounter{aiaa@cfootnote}{\value{footnote}}% store original
    \setcounter{aiaa@cthanks}{#1}%
    \renewcommand\thefootnote{\fnsymbol{aiaa@cthanks}}%
    \footnotemark%
    \setcounter{footnote}{\value{aiaa@cfootnote}}% reset to original
  \endgroup
}

\renewcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \newpage
    \global\@topnum\z@   % Prevents figures from going at top of page.
    \@maketitle
    \@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \renewcommand\thefootnote{\@alph\c@footnote}% change to alpha style footnote
  \aiaa@makecopyright
  \global\let\thanks\relax
  \global\let\thanksibid\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \newpage
  \null
  \begin{center}%
    \vskip\baselineskip
    \vskip1em
  \let \footnote \thanks
    {\LARGE\bfseries \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
  \end{center}%
  \par
  \vskip 1.5ex}

\setlength\hfuzz{2pt}

\fancyhf{}% clear defaults
\renewcommand{\headrulewidth}{0pt}% turn off default headrule
\cfoot{\footnotesize\normalfont
       \thepage\ of \pageref{LastPage}\\
       \rule[.2\baselineskip]{0.5in}{0.2pt}\\
        American Institute of Aeronautics and Astronautics
        \ifx\aiaa@papernumber\@empty
          \relax
        \else
          \if@aiaa@handcarry Paper \aiaa@papernumber\fi
        \fi
       }

\pagestyle{fancy}

\renewenvironment{abstract}%
  {\small\quotation\bfseries}%
  {\normalfont\endquotation\normalsize}

\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{\footnotesize\bfseries #1.~~#2}%
  \ifdim \wd\@tempboxa >\hsize
    \footnotesize\bfseries #1.~~#2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

\setlength\belowcaptionskip{5pt plus 1pt minus 1pt}

\renewcommand\thesection      {\@Roman\c@section}
\renewcommand\thesubsection   {\@Alph\c@subsection}
\renewcommand\thesubsubsection{\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\@alph\c@paragraph}
\renewcommand\thesubparagraph {\@roman\c@subparagraph}
\setcounter{secnumdepth}{3}% no counters \paragraph and below
\def\@seccntformat#1{\csname the#1\endcsname.\quad}

\renewcommand\section{\@startsection {section}{1}{\z@}%
                                     {3.5ex \@plus -1ex \@minus -.2ex}%
                                     {2.3ex \@plus.2ex}%
                                     {\center\normalfont\large\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                       {-3.25ex\@plus -1ex \@minus -.2ex}%
                                       {1.5ex \@plus .2ex}%
                                       {\normalfont\normalsize\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                       {-3.25ex\@plus -1ex \@minus -.2ex}%
                                       {1.5ex \@plus .2ex}%
                                       {\normalfont\normalsize\itshape}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                      {2.25ex \@plus1ex \@minus.2ex}%
                                      {-1em}%
                                      {\normalfont\normalsize\scshape}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                         {2.25ex \@plus1ex \@minus .2ex}%
                                         {-1em}%
                                         {\normalfont\normalfont}}

\renewcommand{\@biblabel}[1]{$^{#1}$}

\renewenvironment{thebibliography}[1]%
     {\section*{\refname\@mkboth{\MakeUppercase\refname}%
                                 {\MakeUppercase\refname}}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\setlength{\leftmargin}{0pt}%
            \settowidth{\labelwidth}{\@biblabel{#1}}%
            \setlength{\itemindent}{\parindent}%
            \advance\itemindent by \labelwidth%
            \setlength{\labelsep}{0.0em}%
            \setlength{\itemsep}{-\smallskipamount}%
            \@openbib@code%
            \usecounter{enumiv}%
            \let\p@enumiv\@empty%
            \renewcommand\theenumiv{\@arabic\c@enumiv}%
            \footnotesize%
            }
      \sloppy\clubpenalty4000\widowpenalty4000%
      \sfcode`\.\@m}
      {\def\@noitemerr
        {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
