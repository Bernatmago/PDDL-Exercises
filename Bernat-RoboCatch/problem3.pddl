(define (problem robot) (:domain room)
(:objects p0 p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 - pos
          p20 p21 p22 p23 p24 p25 p26 p27 p28 p29 p30 p31 p32 p33 p34 p35 p36 p37 p38 p39 - pos
          p40 p41 p42 p43 p44 p45 p46 p47 p48 p49 p50 p51 p52 p53 p54 p55 p56 p57 p58 p59 - pos
          p60 p61 p62 p63 p64 p65 p66 p67 p68 p69 p70 p71 p72 p73 p74 p75 p76 p77 p78 p79 - pos
          p80 p81 p82 p83 p84 p85 p86 p87 p88 p89 p90 p91 p92 p93 p94 p95 p96 p97 p98 p99 - pos
          r - robot
          g - ghost
          go - goal
)

;Cells distribution
;p0 p1 p2 p3 p4 p5 p6 p7 p8 p9
;p10 p11 p12 p13 p14 p15 p16 p17 p18 p19
;p20 p21 p22 p23 p24 p25 p26 p27 p28 p29
;p30 p31 p32 p33 p34 p35 p36 p37 p38 p39
;p40 p41 p42 p43 p44 p45 p46 p47 p48 p49
;p50 p51 p52 p53 p54 p55 p56 p57 p58 p59
;p60 p61 p62 p63 p64 p65 p66 p67 p68 p69
;p70 p71 p72 p73 p74 p75 p76 p77 p78 p79
;p80 p81 p82 p83 p84 p85 p86 p87 p88 p89
;p90 p91 p92 p93 p94 p95 p96 p97 p98 p99
(:init (up p0 p10) (up p1 p11) (up p2 p12) (up p3 p13) (up p4 p14) (up p5 p15) (up p6 p16) (up p7 p17) (up p8 p18) (up p9 p19)
       (up p10 p20) (up p11 p21) (up p12 p22) (up p13 p23) (up p14 p24) (up p15 p25) (up p16 p26) (up p17 p27) (up p18 p28) (up p19 p29)
       (up p20 p30) (up p21 p31) (up p22 p32) (up p23 p33) (up p24 p34) (up p25 p35) (up p26 p36) (up p27 p37) (up p28 p38) (up p29 p39)
       (up p30 p40) (up p31 p41) (up p32 p42) (up p33 p43) (up p34 p44) (up p35 p45) (up p36 p46) (up p37 p47) (up p38 p48) (up p39 p49)
       (up p40 p50) (up p41 p51) (up p42 p52) (up p43 p53) (up p44 p54) (up p45 p55) (up p46 p56) (up p47 p57) (up p48 p58) (up p49 p59)
       (up p50 p60) (up p51 p61) (up p52 p62) (up p53 p63) (up p54 p64) (up p55 p65) (up p56 p66) (up p57 p67) (up p58 p68) (up p59 p69)
       (up p60 p70) (up p61 p71) (up p62 p72) (up p63 p73) (up p64 p74) (up p65 p75) (up p66 p76) (up p67 p77) (up p68 p78) (up p69 p79)
       (up p70 p80) (up p71 p81) (up p72 p82) (up p73 p83) (up p74 p84) (up p75 p85) (up p76 p86) (up p77 p87) (up p78 p88) (up p79 p89)
       (up p80 p90) (up p81 p91) (up p82 p92) (up p83 p93) (up p84 p94) (up p85 p95) (up p86 p96) (up p87 p97) (up p88 p98) (up p89 p99)

       (left p0 p1) (left p2 p3) (left p3 p4) (left p4 p5) (left p5 p6) (left p6 p7) (left p7 p8) (left p8 p9)
       (left p10 p11) (left p12 p13) (left p13 p14) (left p14 p15) (left p15 p16) (left p16 p17) (left p17 p18) (left p18 p19)
       (left p20 p21) (left p22 p23) (left p23 p24) (left p24 p25) (left p25 p26) (left p26 p27) (left p27 p28) (left p28 p29)
       (left p30 p31) (left p32 p33) (left p33 p34) (left p34 p35) (left p35 p36) (left p36 p37) (left p37 p38) (left p38 p39)
       (left p40 p41) (left p42 p43) (left p43 p44) (left p44 p45) (left p45 p46) (left p46 p47) (left p47 p48) (left p48 p49)
       (left p50 p51) (left p52 p53) (left p53 p54) (left p54 p55) (left p55 p56) (left p56 p57) (left p57 p58) (left p58 p59)
       (left p60 p61) (left p62 p63) (left p63 p64) (left p64 p65) (left p65 p66) (left p66 p67) (left p67 p68) (left p68 p69)
       (left p70 p71) (left p72 p73) (left p73 p74) (left p74 p75) (left p75 p76) (left p76 p77) (left p77 p78) (left p78 p79)
       (left p80 p81) (left p82 p83) (left p83 p84) (left p84 p85) (left p85 p86) (left p86 p87) (left p87 p88) (left p88 p89)
       (left p90 p91) (left p92 p93) (left p93 p94) (left p94 p95) (left p95 p96) (left p96 p97) (left p97 p98) (left p98 p99)

       (=(total-cost) 0)
       (robot-on r p0)
       (=(t-robot r) 0)
       (ghost-on g p91)
       (=(t-ghost g p91) 0)
       (ghost-on g p81)
       (=(t-ghost g p81) 1)
       (ghost-on g p71)
       (=(t-ghost g p71) 2)
       (ghost-last g p71)
)
(:goal (done r))
(:metric minimize (total-cost)))
