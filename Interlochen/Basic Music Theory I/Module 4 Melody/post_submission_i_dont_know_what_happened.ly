\version "2.24.2"

\header {
  title = "I Don't Know What Happened in B Minor"
  subtitle = "Interlochen Online ~ Music Theory Basics I ~ Create 4: Write a Melody!"
  composer = "Brian McAuliff Mulloy"
  tagline = \markup {
    \column {
      \center-align {
        "This work is licensed under Creative Commons Attribution 4.0 International."
        "To view a copy of this license, visit https://creativecommons.org/licenses/by/4.0/"
      }
    }
  }
}

\score {
  \relative {
    \key b \minor
    \numericTimeSignature 
    \time 4/4
    \tempo Allegro 4 = 120 
    \mf
    b4 d4 e4-- fis4->  | 
    cis8( b8 a2. \p) | 
    \mf
    g'4 fis8. g16 a2-> | 
    d,4 fis4 g4-- a4-> | 
    f8( e8 d2. \p) | 
    \mf
    cis8 b8 a8. g16 a2-> | 
    \mark \markup {
      \override #'(font-size . 0.5)
      \bold "Agitato"
    }    
      \override TextSpanner.bound-details.left.text = "accel."
    b8\startTextSpan cis8 d8. e16 fis8-> g8 a16 cis16  b16 d16 | 
    a8 g8 fis8.-> e16 fis8 e8 d16 b16 cis16-> a16 | 
    b8-> a8 g8 fis8 g8 a8 b16-> cis16 d16  c16 \stopTextSpan |     
    \mark \markup {
      \override #'(font-size . 0.5)
      \bold "Allegro"
    }    
    b4 a8. g16 a2-> | 
    b4 d4 e4-- fis4-> | 
    cis8( b8 a2. \p) | 
    \mf
    g'4 fis8. g16 a2-> | 
    d,4 fis4 g-- a4-> | 
    e4 d8. e16 fis2-> | 
    b4-> g4 fis4-- d8.-> e16 |
    d4 cis8. a16 b2-> |   
      \override TextSpanner.bound-details.left.text = "rit."
    e8-> d8 cis8.\startTextSpan a16 b2-> | 
    c4-- \p 
    \<
    \grace {
   g16 a16  
}  b2.-> \! \f
    \stopTextSpan  \fermata
  }
  
  \layout { }
  \midi { }
}