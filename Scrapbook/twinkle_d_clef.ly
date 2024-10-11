\version "2.24.2"

\header {
  title = "Twinkle Twinkle Little Star"
}

\markup {
  % Display the custom D clef as an image at the beginning
  \epsfile #2 #2 "D-Clef.eps"
}

\score {
  \new Staff {
    \clef "treble" % Use treble clef for functionality
    
    \key d \major % Set the key to D Ionian (D Major)

    % "Twinkle Twinkle Little Star" in D Ionian
    \relative d' {
      d4 d a' a b b a2
      g4 g fis fis e e d2
      a4 a g g fis fis e2
      a4 a g g fis fis e2
      d4 d a' a b b a2
      g4 g fis fis e e d2
    }
  }
}