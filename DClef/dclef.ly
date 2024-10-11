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
     (moveto 0.0 -0.8571427 
      curveto 0.09136459999999991 -0.47619029999999984 0.1827293000000001 -0.285714 0.45682329999999993 2.9999999995311555e-07 
lineto -0.045682300000000176 2.9999999995311555e-07 
lineto -0.2284117000000001 -0.38095219999999985 
curveto -0.5025056999999999 2.9999999995311555e-07 -1.3247875 -0.19047599999999987 -1.3247875 -0.7619046 
lineto -1.3247875 -1.4285714 
curveto -1.3247875 -1.7142857500000002 -1.5075169000000002 -1.8095238999999999 -1.6902462 -1.8095238999999999 
lineto -1.6902462 -2.0 
lineto -0.4111410000000002 -2.0 
curveto 1.1512114000000002 -2.0000001 1.6902460000000001 -1.1898897 1.6902460000000001 2.9999999995311555e-07 
curveto 1.6902460000000001 1.1627073 1.056661 2.0 -0.4111410000000002 2.0 
lineto -1.6902462 2.0 
lineto -1.6902462 1.8095239999999997 
curveto -1.5075169000000002 1.8095239999999997 -1.3247875 1.7106709999999996 -1.3247875 1.428572 
lineto -1.3247875 0.7619052000000002 
curveto -1.3247875 0.19047649999999994 -0.5025056999999999 2.9999999995311555e-07 -0.2284117000000001 0.3809526999999999 
lineto -0.045682300000000176 2.9999999995311555e-07 
lineto 0.45682329999999993 2.9999999995311555e-07 
curveto 0.1827293000000001 0.2857145000000001 0.09136459999999991 0.47619100000000003 0.0 0.8571433000000002 
curveto 0.0 0.47619100000000003 -0.8679642999999999 0.09523839999999995 -0.8679642999999999 0.5714290000000002 
lineto -0.8679642999999999 1.428572 
curveto -0.8679642999999999 1.6190480000000003 -0.685235 1.8095239999999997 -0.4111410000000002 1.8095239999999997 
curveto 0.6710866000000002 1.8095239999999997 1.0506935 1.1347450000000001 1.0506935 2.9999999995311555e-07 
curveto 1.0506935 -1.0789877 0.685235 -1.8095238999999999 -0.4111410000000002 -1.8095238999999999 
curveto -0.685235 -1.8095238999999999 -0.8679642999999999 -1.6190476999999999 -0.8679642999999999 -1.4285714 
lineto -0.8679642999999999 -0.5714284000000001 
curveto -0.8679642999999999 -0.09523780000000004 0.0 -0.47619029999999984 0.0 -0.8571427
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


