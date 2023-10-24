\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{dfg_cv}
\LoadClass[11pt,a4paper]{scrartcl}

%%% DFG format specifics
\RequirePackage[a4paper,left=2.5cm,textwidth=16.5cm,top=2.5cm,textheight=25.7cm]{geometry} % Seitenränder aus rtf konvertiert (paperw11900/paperh16840/margl1418/margr1134/margb851/margt1418)
\pagestyle{empty} % disable pagenumbering
\RequirePackage{xcolor}
\RequirePackage{hyperref}
\RequirePackage[english,main=german]{babel}
\RequirePackage[german=quotes]{csquotes}


% Use helvet to be close to Arial (<- required by DFG)
\RequirePackage[scaled=.95]{helvet} % Do not scale smaller than .95! smaller factors violate the DFG requirement that Arial 11pt may not be undercut
\renewcommand\familydefault{phv}

\RequirePackage{sectsty}
\allsectionsfont{\normalsize} % Let headings have the same size as the rest of the text
\RequirePackage{enumitem} % for compact itemize/enumerate

\RequirePackage{varwidth}
\RequirePackage{tabularray}

%% Disable all "continue on next page"-captions produced by longtblr
\DefTblrTemplate{contfoot-text}{default}{}
\DefTblrTemplate{conthead-text}{default}{}
\DefTblrTemplate{caption}{default}{}
\DefTblrTemplate{conthead}{default}{}
\DefTblrTemplate{capcont}{default}{}

\RequirePackage{setspace}
\renewcommand{\baselinestretch}{1.2} % Zeilenabstand 1.2
\RequirePackage{ragged2e} % Kein Blocksatz in Tabelle
\RequirePackage{soul} % Underline with overlap (vs. \underline)
\setuldepth{www.de/}

\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=MY,prefix=MY@}
\newcommand{\dcheck}{~~}

% Have an option that allows to check the checkbox in the data protection declaration
\DeclareBoolOption{checked}
\DeclareBoolOption{walterbenjamin}

\ProcessKeyvalOptions*

\ifMY@checked
  \renewcommand{\dcheck}{\,X\,}
\fi


%% Have tables with thicker border
\newcommand{\vthick}{1pt}
\newcommand{\thick}{0.8pt}
\RequirePackage{tabularx}
\RequirePackage{xltabular}
\RequirePackage{makecell}
\RequirePackage{array}

\newcolumntype{?}{!{\vrule width \vthick}}
\newcolumntype{+}{!{\vrule width \thick}}


\DeclareRobustCommand\actitle[1]{\gdef\@actitle{#1}}
\DeclareRobustCommand\vorname[1]{\gdef\@vorname{#1}}
\DeclareRobustCommand\nachname[1]{\gdef\@nachname{#1}}
\DeclareRobustCommand\position[1]{\gdef\@position{#1}}
\DeclareRobustCommand\institution[1]{\gdef\@institution{#1}}
\DeclareRobustCommand\orcid[1]{\gdef\@orcid{#1}}
\DeclareRobustCommand\schule[1]{\gdef\@schule{#1}}
\DeclareRobustCommand\studium[1]{\gdef\@studium{#1}}
\DeclareRobustCommand\promotion[1]{\gdef\@promotion{#1}}
\DeclareRobustCommand\stationen[1]{\gdef\@stationen{#1}}



%%% DFG content specfics
\AtBeginDocument{
    \section*{Curriculum Vitae}
    \section*{Persönliche Daten}

    % Persönliche Daten - Tabelle
    \begin{tabularx}{\textwidth}{?p{5.24cm}+X?}\Xhline{\vthick}
        Titel & \@actitle  \\ \Xhline{\thick}
        Vorname & \@vorname \\ \Xhline{\thick}
        Name & \@nachname \\ \Xhline{\thick}
        Aktuelle Position & \@position \\ \Xhline{\thick}
        Aktuelle Institution(en)/Ort(e), Land & \@institution \\ \Xhline{\thick}
        Identifikatoren/ORCID & \@orcid \\
    \Xhline{\vthick}\end{tabularx}


    % Qualifizierung und Werdegang - Tabelle
    \section*{Qualifizierung und Werdegang}
    \begin{tabularx}{\textwidth}{?p{5.24cm}+X?}\Xhline{\vthick}
        \textbf{Stationen} & \textbf{Zeiträume und nähere Einzelheiten} \\ \Xhline{\thick}
        \ifMY@walterbenjamin
            Schule, Land & \@schule \\ \Xhline{\thick}
        \fi
            Studium & \@studium \\ \Xhline{\thick}
            Promotion & \@promotion \\ \Xhline{\thick}
            Stationen des wissenschaftlichen/beruflichen Werdegangs & \@stationen \\
    \Xhline{\vthick}\end{tabularx}
}




% --- Ergänzende Angaben zum Werdegang ---
\newcommand{\secWerdegang}{\section*{Ergänzende Angaben zum Werdegang}} % optional, Freitextfeld

% --- Engagement im Wissenschaftssystem ---
\newcommand{\secEngagement}{\section*{Engagement im Wissenschaftssystem}} % optional, Freitextfeld

% --- Betreuung von Forschenden in frühen Karrierephasen ---
\newcommand{\secBetreuung}{\section*{Betreuung von Forschenden in frühen Karriephasen}} % optional, Freitextfeld

% --- Wissenschaftliche Ergebnisse ---
\newcommand{\secErgebnisse}{\section*{Wissenschaftliche Ergebnisse}} % Teil A obligatorisch, Teil B optional, Freitextfelder

% --- Kategorie A ---
\newcommand{\secKatA}{\section*{Kategorie A}} % obligatorisch, Freitextfeld

% --- Kategorie B ---
\newcommand{\secKatB}{\section*{Kategorie B}} % optional, Freitextfeld


% --- Anerkennung durch das Wissenschaftssystem ---
\newcommand{\secAnerkennung}{\section*{Anerkennung durch das Wissenschaftssystem}} % optional, Freitextfeld

% --- Sonstige Angaben --- 
\newcommand{\secSonstiges}{\section*{Sonstige Angaben}} % optional, Freitextfeld

% --- Datenschutz und Einwilligung in die Verarbeitung optionaler Angaben ---
\AtEndDocument{\section*{Datenschutz und Einwilligung in die Verarbeitung optionaler Angaben}
{\small
Sofern Sie in diesem CV freiwillige (als optional gekennzeichnete) Angaben machen, ist Ihre Einwilligung erforderlich. Bitte bestätigen Sie uns Ihre Zustimmung durch Ankreuzen der nachfolgenden Checkbox.

\vspace{.4\baselineskip}

\noindent \textbf{[\dcheck] Ich willige ausdrücklich in die Verarbeitung der freiwilligen (optionalen) Angaben, einschließlich \enquote{besonderer Kategorien personenbezogener Daten} zum Zwecke der Prüfung und Entscheidung über meinen Antrag durch die DFG ein.} Dies beinhaltet auch die Weiterleitung meiner Daten an die am Entscheidungsprozess beteiligten externen Gutachtenden, Gremienmitglieder sowie ggf. ausländische Partnerorganisationen. Soweit diese Empfängerinnen und Empfänger ihren Sitz in einem Drittland (außerhalb des Europäischen Wirtschaftraums) haben, willige ich zusätzlich darin ein, dass diesen Zugriff auf meine Daten zu oben genannten Zwecken gewährt wird, obwohl unter Umständen kein mit dem EU-Recht vergleichbares Datenschutzniveau gewährleistet ist. Daher ist die Einhaltung der Datenschutz-Grundsätze des Unionsrechts nicht garantiert. Insoweit kann es zu einer Verletzung meiner Grundrechte und Grundfreiheiten und daraus resultierender Schäden kommen. Dadurch kann es mir erschwert sein, meine Rechte gemäß der Datenschutz-Grundverordnung (z. B. Auskunft, Berichtigung, Löschung, Schadensersatz) geltend zu machen und ggf. mit Hilfe von Behörden oder gerichtlich durchzusetzen.

\vspace{.4\baselineskip} 

\noindent Meine Einwilligung kann ich jederzeit ganz oder in Teilen – mit Wirkung für die Zukunft, frei und ohne Angabe von Gründen – gegenüber der DFG \textbf{widerrufen} (\ul{postmaster@dfg.de}). Die Rechtmäßigkeit der bis dahin erfolgten Verarbeitung bleibt davon unberührt. Soweit ich in diesem CV „besondere Kategorien personenbezogener Daten“ Dritter übermittele, sichere ich zu, dass die insoweit erforderliche datenschutzrechtliche Legitimation besteht (z. B. durch eine Einwilligung).

\vspace{.4\baselineskip} 

\noindent Die Datenschutzhinweise zur Forschungsförderung der DFG, die ich unter \ul{www.dfg.de/service/} \ul{datenschutz} abrufen kann, habe ich zur Kenntnis genommen und leite diese an solche Personen weiter, deren Daten die DFG verarbeitet, weil sie in diesem CV aufgeführt sind.}}


%%% MISC
\newenvironment{compactItemize}
{
\begin{itemize}[noitemsep,nolistsep,leftmargin=*]
}
{
\end{itemize}
}
\newenvironment{compactEnumerate}
{
\begin{enumerate}[noitemsep,nolistsep,leftmargin=2em]
}
{
\end{enumerate}
}

\newcommand{\optionaltext}{\textcolor{blue}{\textbf{optionales Freitextfeld --  siehe für weitere Informationen: \url{https://www.dfg.de/formulare/53_200_elan/53_200_de_elan.rtf} }}}
\newcommand{\semioptionaltext}{\textcolor{orange}{\textbf{optionales Freitextfeld (außer für Graduiertenkollegs) --  siehe für weitere Informationen: \url{https://www.dfg.de/formulare/53_200_elan/53_200_de_elan.rtf} }}}
