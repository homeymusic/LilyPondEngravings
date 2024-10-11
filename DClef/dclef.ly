\version "2.22.2"

\header {
  texidoc = "
This snippet shows how to print a new clef glyph - here an old style
bass clef - with a path encoding (support svg output). 

"
  doctitle = "Creating a custom clef glyph"
}
%% http://lsr.di.unimi.it/LSR/Item?u=1&id=900
%% <= http://lilypond.1069038.n5.nabble.com/Old-Bass-Clef-td28833.html
% add by P.P.Schneider on March 2014. Edited on June. 2017.

%% Path drawing:
%% M = moveto
%% m = rmoveto
%% lineto = lineto
%% l = rlineto
%% curveto = curveto
%% c = rcurveto
%% z = closepath  

d-clef =
#(ly:make-stencil
  `(path 0.001
     (moveto 2.5 1.6428573 
       curveto 2.5913646 2.0238097 2.6827293 2.214286 2.9568233 2.5000003
       lineto 2.4543177 2.5000003
       lineto 2.2715883 2.1190478
       curveto 1.9974943 2.5000003 1.1752125 2.309524 1.1752125 1.7380954
       lineto 1.1752125 1.0714286
       curveto 1.1752125 .78571425 .9924831 .6904761 .8097538 .6904761
       lineto .8097538 .5
       lineto 2.088859 .5
       curveto 3.6512114 .4999999 4.190246 1.3101103 4.190246 2.5000003
       curveto 4.190246 3.6627073 3.556661 4.5 2.088859 4.5
       lineto .8097538 4.5
       lineto .8097538 4.309524
       curveto .9924831 4.309524 1.1752125 4.210671 1.1752125 3.928572
       lineto 1.1752125 3.2619052
       curveto 1.1752125 2.6904765 1.9974943 2.5000003 2.2715883 2.8809527
       lineto 2.4543177 2.5000003
       lineto 2.9568233 2.5000003
       curveto 2.6827293 2.7857145 2.5913646 2.976191 2.5 3.3571433
       curveto 2.5 2.976191 1.6320357 2.5952384 1.6320357 3.071429
       lineto 1.6320357 3.928572
       curveto 1.6320357 4.119048 1.814765 4.309524 2.088859 4.309524
       curveto 3.1710866 4.309524 3.5506935 3.634745 3.5506935 2.5000003
       curveto 3.5506935 1.4210123 3.185235 .6904761 2.088859 .6904761
       curveto 1.814765 .6904761 1.6320357 .8809523 1.6320357 1.0714286
       lineto 1.6320357 1.9285716
       curveto 1.6320357 2.4047622 2.5 2.0238097 2.5 1.6428573
       closepath)
     round round #t)
   )

\layout {
  \context {
    \Score
    \override Clef.stencil = 
      #(lambda (grob) 
         (let* ((sz (ly:grob-property grob 'font-size 0)) 
                (mlt (magstep sz))
                (glyph (ly:grob-property grob 'glyph-name))) 
                 (cond
                  ((equal? glyph "clefs.F")  
                     (ly:stencil-scale d-clef (* 1 mlt) (* 1 mlt)))
                  ((equal? glyph "clefs.F_change")  
                    (ly:stencil-scale d-clef (* .8 mlt) (* .8 mlt)))
                  (else (ly:clef::print grob)))))
  }
}

%% Test:
#(set-global-staff-size 30)

\new GrandStaff <<
  \new Staff { 
    \clef G c'1 
    \clef F c 
    \clef G c' 
    <<
      a,
      \new CueVoice {
        %% Does not work:
        %\cueClef F
        \once\override Staff.Clef.font-size = #-4
        \clef F 
        f^"cue"
      }
    >>
  }
  \new Staff  {
    \clef F c1 
    \clef G c' 
    \clef "F^8" c' f
  }
>>


