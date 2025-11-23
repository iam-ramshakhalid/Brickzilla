#### Brickzilla
### Overview
#Brick Breaker is a classic arcade‑style game developed in 8086 Assembly Language using text‑mode graphics.
#The player controls a paddle to bounce a ball and break all bricks while managing lives and score.

### Features
#Paddle movement using arrow keys

#Ball movement + collision detection

#Multiple brick types (including red power‑up bricks)

#Bonus system for fast brick clearing

#Score & lives display

#Intro, menu, instructions, about, and game-over screens

#Sound effects

### Technical Details
#Language: 8086 Assembly (MASM/TASM)

#Video Mode: 03h (80×25 text mode)

#Screen rendering via B800h memory writes

#Keyboard via INT 16h

#Sound via PIT (Port 42h/61h)

###  How to Play
#Left / Right Arrow Keys → Move paddle

#Space → Release ball

#Don’t let the ball fall

#Break all bricks to win

#Red bricks give paddle power‑ups

### Contributions
#Both contributors worked together on game logic, UI, debugging, and core mechanics.

---> Ramsha Khalid – Ball physics, brick collisions, power‑ups, sound

---> Zuhar Faisal – Menus, UI design, instruction screens, formatting
