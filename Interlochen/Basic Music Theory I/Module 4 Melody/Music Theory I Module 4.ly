\version "2.24.2"  % Ensure compatibility with your LilyPond version

\score {
  \relative {
    \key b \minor
    \numericTimeSignature  % Forces the display of "4/4" instead of "C"
    \time 4/4

    b4 d4 e4 fis4 | cis8 b8 a2. | g4 fis8. g16 a2 |
  }
  
  \midi { }  % This will generate a MIDI file
}