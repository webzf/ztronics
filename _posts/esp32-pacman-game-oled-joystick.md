---

title: "ESP32 Pac-Man Game with OLED and Joystick"

howto: true

layout: single

permalink: /esp32-pacman-game-oled-joystick/

sidebar:
nav: "embedded"

excerpt: "Build a mini Pac-Man game with an ESP32, SSD1306 OLED, KY-023 joystick and buzzer. Learn how to create a tile-based game, joystick controls, ghost AI, animations, sound effects and game states."

show_date: false
read_time: false
last_modified_at: false

toc: true
toc_sticky: true
toc_label: "Contents"

header:
teaser: /assets/images/esp32-pacman-game.webp
image: /assets/images/esp32-pacman-game.webp
og_image: /assets/images/esp32-pacman-game.webp
overlay_image: /assets/images/header3.webp
overlay_filter: 0.25

categories:

- Arduino
- ESP32
- Projects

tags:

- ESP32
- Pac-Man
- Arduino
- OLED
- SSD1306
- Joystick
- KY-023
- Buzzer
- Wokwi
- ESP32 Game

related: true
share: true

required_hardware:

- id: esp32-devkit
  component: ESP32 Development Board

- id: ssd1306-oled
  component: SSD1306 OLED Display

- id: ky-023
  component: KY-023 Analog Joystick Module

- id: passive-buzzer
  component: Passive Buzzer

- id: solderless-breadboard
  component: Solderless Breadboard

- id: jumper-wires
  component: Jumper Wires

---

ESP32 Pac-Man Game with OLED and Joystick

Building a game is one of the best ways to learn how an ESP32 handles inputs, graphics, timing, sound and program logic.

In this project, we'll build a mini Pac-Man game using an ESP32, a 128×64 SSD1306 OLED display, a KY-023 analog joystick and a passive buzzer.

The game runs entirely on the ESP32 and includes:

- Analog joystick control
- SSD1306 OLED graphics
- Pellet collection
- Score tracking
- Three lives
- Two ghosts with different behaviours
- Pac-Man directional animation
- Sound effects
- Pause and restart controls
- Game Over screen
- Victory screen
- Death animation
- Automatic joystick calibration
- Non-blocking timing using "millis()"

The complete project can also be simulated in Wokwi before building the physical circuit.

![ESP32 Pac-Man game running on an SSD1306 OLED with a joystick and buzzer]({{ '/assets/images/esp32-pacman-game.webp' | relative_url }})

What You'll Learn

By the end of this project, you'll understand how to combine several embedded programming techniques into one complete application.

You'll learn how to:

- Read an analog joystick with an ESP32
- Calibrate the joystick centre position
- Implement a joystick dead zone
- Control an SSD1306 OLED using I2C
- Create a tile-based game map
- Move characters smoothly between tiles
- Detect walls and collisions
- Create simple enemy AI
- Use bitmap graphics
- Create directional animations
- Generate buzzer sound effects
- Implement a game state machine
- Use "millis()" instead of blocking delays
- Create a complete ESP32 game loop

This makes the project useful even if you're not particularly interested in Pac-Man itself.

The same techniques can be reused for many other ESP32 games and interactive projects.

Project Overview

The game uses a small maze designed specifically for a 128×64 monochrome OLED.

The display is divided into two areas:

128 × 64 pixels

┌────────────────────────────────┐
│ S:0120                 ● ● ●   │
├────────────────────────────────┤
│                                │
│       ●                        │
│   ┌───────┐       ●            │
│   │       │                    │
│   │   ●   │       👻           │
│   └───────┘                    │
│                  👻            │
└────────────────────────────────┘

The top 8 pixels are used for the HUD.

The remaining 56 pixels provide seven rows of 8-pixel tiles.

Since each tile is 8×8 pixels:

128 / 8 = 16 tiles
56 / 8 = 7 tiles

The playable area is therefore:

16 × 7 tiles

This keeps the game logic simple enough for an ESP32 while still producing a recognisable retro game.

Hardware Required

For this project you need:

{% include required-hardware.html products=page.required_hardware %}

The project is deliberately built using inexpensive and widely available modules.

The most important components are the ESP32, SSD1306 OLED and KY-023 joystick.

The same combination can also be used for other projects such as OLED menus, robotics controls and small embedded games.

Circuit Connections

SSD1306 OLED

The OLED communicates with the ESP32 using I2C.

SSD1306| ESP32
VCC| 5V
GND| GND
SDA| GPIO 21
SCL| GPIO 22

The Wokwi display uses the standard I2C address:

0x3C

![ESP32 connected to an SSD1306 OLED using I2C]({{ '/assets/images/esp32-pacman-oled-wiring.webp' | relative_url }})

If you want a more detailed explanation of SSD1306 displays and I2C connections, see our [ESP32 OLED Tutorial]({{ '/esp32-oled-tutorial-wiring-code-display-guide/' | relative_url }}).

KY-023 Joystick

The joystick provides two analog axes and one push button.

KY-023| ESP32
VCC| 5V
GND| GND
HORZ| GPIO 35
VERT| GPIO 34
SEL| GPIO 27

The analog axes are connected to GPIO 34 and GPIO 35, which are ADC1 pins on the ESP32.

The push button is configured using the ESP32's internal pull-up resistor.

![KY-023 analog joystick connected to an ESP32]({{ '/assets/images/esp32-pacman-joystick.webp' | relative_url }})

For a detailed explanation of the KY-023, including calibration and dead zones, see our [ESP32 Joystick Tutorial]({{ '/esp32-Joystick-Tutorial-Read-an-Analog-Joystick-%28KY-023%29-with-Arduino-IDE/' | relative_url }}).

Buzzer

The passive buzzer is connected to:

Buzzer| ESP32
Pin 1| GND
Pin 2| GPIO 13

The ESP32 generates the different tones using its LEDC peripheral.

Complete Wiring

The complete circuit uses only a small number of connections.

                    ESP32
               ┌─────────────┐
               │             │
 OLED SDA ─────┤ GPIO 21     │
 OLED SCL ─────┤ GPIO 22     │
               │             │
 Joystick X ───┤ GPIO 35     │
 Joystick Y ───┤ GPIO 34     │
 Joystick SW ──┤ GPIO 27     │
               │             │
 Buzzer ───────┤ GPIO 13     │
               │             │
               └─────────────┘

 OLED
 ┌─────────┐
 │ SSD1306 │
 │         │
 │ SDA ────┼──── GPIO 21
 │ SCL ────┼──── GPIO 22
 │ VCC ────┼──── 5V
 │ GND ────┼──── GND
 └─────────┘

 KY-023
 ┌──────────┐
 │ Joystick │
 │          │
 │ HORZ ────┼──── GPIO 35
 │ VERT ────┼──── GPIO 34
 │ SEL ─────┼──── GPIO 27
 │ VCC ─────┼──── 5V
 │ GND ─────┼──── GND
 └──────────┘

 Buzzer
 ┌────────┐
 │        │
 │   ─────┼──── GPIO 13
 │   ─────┼──── GND
 └────────┘

Testing the ESP32 Pac-Man Game in Wokwi

Before assembling the physical circuit, you can test the complete project in Wokwi.

"Open the ESP32 Pac-Man project in Wokwi" (https://wokwi.com/projects/462408214673176577)

The simulation includes:

- ESP32 DevKit
- SSD1306 OLED
- Analog joystick
- Buzzer
- Complete wiring
- Game firmware

Wokwi is particularly useful for this project because you can modify the maze, game speed and AI without repeatedly uploading firmware to a physical ESP32.

Installing the Arduino Library

The project uses the U8g2 graphics library to control the SSD1306 OLED.

In Arduino IDE, open:

Sketch
→ Include Library
→ Manage Libraries

Search for:

U8g2

Install the library by Oliver Kraus.

The project also uses the standard Arduino "Wire" library for I2C communication.

Creating the Maze

Instead of drawing every wall individually, the game stores the maze as a simple character array.

const char* mazeTemplate[MAZE_HEIGHT] = {
  "################",
  "#..............#",
  "#.####.##.####.#",
  "#.#....##....#.#",
  "#.#.##....##.#.#",
  "#..............#",
  "################"
};

Each character represents a tile.

Character| Meaning
"#"| Wall
"."| Pellet
Space| Empty tile

This is a very efficient way of representing a small game map.

Instead of storing a bitmap containing thousands of pixels, the ESP32 only needs to store a few dozen characters.

Rendering the Maze

The OLED resolution is 128×64.

Each tile is 8×8 pixels.

The program converts the tile coordinates into display coordinates:

int screenY =
  HUD_HEIGHT +
  y * TILE_SIZE;

A wall is then rendered as a filled 8×8 rectangle:

u8g2.drawBox(
  x * TILE_SIZE,
  screenY,
  TILE_SIZE,
  TILE_SIZE
);

Pellets are rendered as small circles:

u8g2.drawDisc(
  x * TILE_SIZE + 4,
  screenY + 4,
  1
);

This simple rendering system is enough to create the entire maze.

Pac-Man Movement

Pac-Man is represented using an "Entity" structure:

struct Entity {
  float x;
  float y;

  int dirX;
  int dirY;
};

The position uses floating-point values so Pac-Man can move smoothly between tile centres.

The direction is represented by two integers.

Right →  1,  0
Left  → -1,  0
Down  →  0,  1
Up    →  0, -1

Before moving, the program checks whether the next tile contains a wall.

bool canMove(
  Entity e,
  int dirX,
  int dirY
)

This prevents Pac-Man from travelling through walls.

Queued Joystick Movement

A useful detail in the game is the direction queue.

The joystick input is stored in:

int queuedDirX = 1;
int queuedDirY = 0;

Suppose Pac-Man is moving right and the player pushes the joystick upward before reaching an intersection.

The requested direction is remembered.

When Pac-Man reaches the next tile centre, the program checks whether the new direction is possible.

This makes the game much easier to control than requiring perfectly timed joystick movements.

Joystick Calibration

Analog joysticks do not always return exactly the same centre value.

The program therefore measures the joystick during startup.

void calibrateJoystick() {

  long sumX = 0;
  long sumY = 0;

  for (int i = 0; i < 20; i++) {

    sumX += analogRead(JOY_X);
    sumY += analogRead(JOY_Y);

    delay(10);
  }

  centerX = sumX / 20;
  centerY = sumY / 20;
}

The average of 20 readings becomes the joystick centre.

Make sure the joystick is untouched while the ESP32 starts.

Joystick Dead Zone

Small variations around the centre position are normal with analog joysticks.

The game therefore uses a dead zone:

#define JOYSTICK_THRESHOLD 700

Movements smaller than this threshold are ignored.

This prevents Pac-Man from slowly moving when the joystick is supposed to be centred.

The dead-zone concept is explained in more detail in our [ESP32 Joystick Tutorial]({{ '/esp32-Joystick-Tutorial-Read-an-Analog-Joystick-%28KY-023%29-with-Arduino-IDE/' | relative_url }}).

Pac-Man Directional Animation

The game uses small 8×8 bitmap sprites.

Separate sprites are stored for:

- Right
- Left
- Up
- Down
- Mouth closed

For example:

const unsigned char pacOpenRight[] PROGMEM = {
  0x3C,
  0x7E,
  0xFC,
  0xF8,
  0xFC,
  0x7E,
  0x3C,
  0x00
};

The sprite selected for rendering depends on Pac-Man's current direction.

This means that Pac-Man turns when the player changes direction rather than always facing the same way.

The mouth is also animated by alternating between open and closed sprites.

Ghost AI

The game contains two ghosts.

They deliberately use different behaviours.

This is a simple example of game AI running on a microcontroller.

Ghost 1 — Chaser

The first ghost directly targets Pac-Man.

It calculates the Manhattan distance between possible positions and Pac-Man's current tile.

The Manhattan distance is:

|x1 - x2| + |y1 - y2|

This is computationally inexpensive and works well for a small grid-based game.

Ghost 2 — Ambusher

The second ghost attempts to target a position several tiles ahead of Pac-Man.

int targetX =
  round(pac.x) +
  pac.dirX * 3;

int targetY =
  round(pac.y) +
  pac.dirY * 3;

This creates the impression that the ghost is trying to predict the player's movement.

The AI isn't intended to reproduce the original arcade game's algorithms exactly.

Instead, it demonstrates how simple target-based decision making can create interesting behaviour on an ESP32.

Ghost Direction Selection

At an intersection, the ghost evaluates the available directions.

Walls are ignored.

The algorithm also tries to avoid immediately reversing direction.

This prevents the ghosts from constantly oscillating between two tiles.

If no alternative exists, reversing direction is allowed.

The result is simple but effective AI that requires very little processing power.

Collision Detection

Pac-Man and the ghosts use floating-point coordinates.

Collision detection therefore uses distance.

float distance1 = sqrt(
  pow(pac.x - ghost1.x, 2) +
  pow(pac.y - ghost1.y, 2)
);

A collision is detected when the distance becomes smaller than the collision threshold:

return (
  distance1 < 0.55f ||
  distance2 < 0.55f
);

This approach is more reliable than requiring the two entities to occupy exactly the same coordinates.

Score and Pellets

Every pellet is worth 10 points.

When Pac-Man enters a tile containing a pellet:

score += 10;

The pellet is then removed:

mapData[tileY][tileX] = ' ';

The game also maintains a counter:

pelletsRemaining

When the counter reaches zero, the game enters the victory state.

Lives

The game starts with three lives:

int lives = 3;

When Pac-Man collides with a ghost, one life is removed.

If lives remain, Pac-Man and the ghosts return to their starting positions.

If all three lives are lost, the game displays:

GAME OVER

The player can then press the joystick button to start again.

Game States

The project uses a state machine rather than a collection of independent Boolean flags.

enum GameState {
  GAME_MENU,
  GAME_READY,
  GAME_PLAYING,
  GAME_PAUSED,
  GAME_DYING,
  GAME_WIN,
  GAME_OVER
};

The basic flow is:

MENU
  ↓
READY
  ↓
PLAYING
  ↓
 ┌───────────────┐
 │               │
PAUSED         DYING
 │               │
 └──→ PLAYING    ↓
              READY

PLAYING
   ↓
YOU WIN

PLAYING
   ↓
GAME OVER

Using explicit states makes it much easier to add new features later.

Pause and Restart

The joystick push button provides two different controls.

A short press while playing pauses the game.

Pressing it again resumes the game.

A long press resets the game.

This gives the player a complete control system without requiring additional buttons.

Why "millis()" Is Used Instead of "delay()"

A game needs to perform several things at the same time.

For example:

- Move Pac-Man
- Move ghosts
- Animate sprites
- Read the joystick
- Play sounds
- Detect collisions
- Update the OLED

Using a large "delay()" would block the processor and make the game less responsive.

Instead, the final version uses "millis()".

For example:

unsigned long now = millis();

if (
  now - lastPacMove >=
  PAC_MOVE_INTERVAL
) {

  movePac();

  lastPacMove = now;
}

This allows the ESP32 to perform other tasks while waiting for the next movement update.

Separate timers are used for different systems.

This is an important pattern for more advanced Arduino and ESP32 projects.

Sound Effects

The passive buzzer provides several sound effects.

Pellet Sound

When Pac-Man eats a pellet, the buzzer generates a short two-tone sound.

ledcWriteTone(BUZZER, 900);

followed by a lower frequency.

Death Sound

The death sound starts at a higher frequency and gradually decreases.

soundFrequency -= 55;

This produces a simple descending effect.

Victory Sound

The victory sound uses several increasing frequencies:

700 Hz
900 Hz
1100 Hz
1500 Hz

The sound system is also non-blocking, so playing a sound does not freeze the game.

Death Animation

When Pac-Man collides with a ghost, the game enters:

GAME_DYING

Instead of instantly resetting the character, a short animation is displayed.

Pac-Man progressively disappears before the next life begins.

The sequence is:

COLLISION
    ↓
DEATH SOUND
    ↓
DEATH ANIMATION
    ↓
READY!
    ↓
CONTINUE

If the player has no lives remaining, the game goes to the Game Over screen instead.

The Complete ESP32 Pac-Man Code

The following is the complete sketch used for the project.

/*
  Embedded Nerd
  https://embeddednerd.com

  Mini Pac-Man for ESP32
  OLED 128x64 + Analog Joystick + Buzzer
*/

#include <Wire.h>
#include <U8g2lib.h>
#include <math.h>

#define JOY_X 35
#define JOY_Y 34
#define JOY_SW 27
#define BUZZER 13

U8G2_SSD1306_128X64_NONAME_F_HW_I2C u8g2(
  U8G2_R0,
  U8X8_PIN_NONE
);

#define SCREEN_WIDTH  128
#define SCREEN_HEIGHT 64

#define TILE_SIZE 8
#define HUD_HEIGHT 8

#define MAZE_WIDTH  16
#define MAZE_HEIGHT 7

#define PAC_SPEED   0.16f
#define GHOST_SPEED 0.13f

#define JOYSTICK_THRESHOLD 700

const unsigned long PAC_MOVE_INTERVAL   = 28;
const unsigned long GHOST_MOVE_INTERVAL = 32;
const unsigned long ANIMATION_INTERVAL  = 120;

const unsigned long READY_DURATION      = 1200;
const unsigned long DEATH_DURATION      = 900;

const unsigned long BUTTON_DEBOUNCE     = 40;
const unsigned long LONG_PRESS_TIME     = 1200;

enum GameState {
  GAME_MENU,
  GAME_READY,
  GAME_PLAYING,
  GAME_PAUSED,
  GAME_DYING,
  GAME_WIN,
  GAME_OVER
};

GameState gameState = GAME_MENU;

const char* mazeTemplate[MAZE_HEIGHT] = {
  "################",
  "#..............#",
  "#.####.##.####.#",
  "#.#....##....#.#",
  "#.#.##....##.#.#",
  "#..............#",
  "################"
};

char mapData[MAZE_HEIGHT][MAZE_WIDTH + 1];

struct Entity {
  float x;
  float y;
  int dirX;
  int dirY;
};

Entity pac;
Entity ghost1;
Entity ghost2;

int queuedDirX = 1;
int queuedDirY = 0;

int score = 0;
int lives = 3;
int pelletsRemaining = 0;

bool mouthOpen = true;
bool pelletVisible = true;

int centerX = 0;
int centerY = 0;

unsigned long lastPacMove = 0;
unsigned long lastGhostMove = 0;
unsigned long lastAnimation = 0;
unsigned long stateStartTime = 0;

bool lastButtonReading = HIGH;
bool buttonState = HIGH;

unsigned long lastDebounceTime = 0;
unsigned long buttonPressTime = 0;

bool longPressTriggered = false;

enum SoundType {
  SOUND_NONE,
  SOUND_WAKA,
  SOUND_DEATH,
  SOUND_WIN
};

SoundType currentSound = SOUND_NONE;

unsigned long soundStartTime = 0;
unsigned long lastSoundStep = 0;

int soundFrequency = 0;

const unsigned char pacOpenRight[] PROGMEM = {
  0x3C,
  0x7E,
  0xFC,
  0xF8,
  0xFC,
  0x7E,
  0x3C,
  0x00
};

const unsigned char pacClosed[] PROGMEM = {
  0x3C,
  0x7E,
  0xFF,
  0xFF,
  0xFF,
  0x7E,
  0x3C,
  0x00
};

const unsigned char pacOpenLeft[] PROGMEM = {
  0x3C,
  0x7E,
  0x3F,
  0x1F,
  0x3F,
  0x7E,
  0x3C,
  0x00
};

const unsigned char pacOpenUp[] PROGMEM = {
  0x3C,
  0x7E,
  0xFF,
  0xFC,
  0xF8,
  0xF0,
  0xE0,
  0x00
};

const unsigned char pacOpenDown[] PROGMEM = {
  0x07,
  0x0F,
  0x1F,
  0x3F,
  0xFF,
  0x7E,
  0x3C,
  0x00
};

const unsigned char ghostSprite1[] PROGMEM = {
  0x3C,
  0x7E,
  0xDB,
  0xFF,
  0xFF,
  0xDB,
  0xFF,
  0x00
};

const unsigned char ghostSprite2[] PROGMEM = {
  0x3C,
  0x7E,
  0xA5,
  0xFF,
  0xFF,
  0xA5,
  0xDB,
  0x00
};

void copyMaze() {

  pelletsRemaining = 0;

  for (int y = 0; y < MAZE_HEIGHT; y++) {

    strcpy(mapData[y], mazeTemplate[y]);

    for (int x = 0; x < MAZE_WIDTH; x++) {

      if (mapData[y][x] == '.') {
        pelletsRemaining++;
      }

    }

  }

}

bool wallAt(int x, int y) {

  if (
    x < 0 ||
    x >= MAZE_WIDTH ||
    y < 0 ||
    y >= MAZE_HEIGHT
  ) {
    return true;
  }

  return mapData[y][x] == '#';

}

void calibrateJoystick() {

  long sumX = 0;
  long sumY = 0;

  for (int i = 0; i < 20; i++) {

    sumX += analogRead(JOY_X);
    sumY += analogRead(JOY_Y);

    delay(10);

  }

  centerX = sumX / 20;
  centerY = sumY / 20;

}

void readJoystickQueue() {

  int xValue = analogRead(JOY_X);
  int yValue = analogRead(JOY_Y);

  int dx = xValue - centerX;
  int dy = yValue - centerY;

  if (
    abs(dx) < JOYSTICK_THRESHOLD &&
    abs(dy) < JOYSTICK_THRESHOLD
  ) {
    return;
  }

  if (abs(dx) > abs(dy)) {

    if (dx < -JOYSTICK_THRESHOLD) {

      queuedDirX = 1;
      queuedDirY = 0;

    }
    else if (dx > JOYSTICK_THRESHOLD) {

      queuedDirX = -1;
      queuedDirY = 0;

    }

  }
  else {

    if (dy < -JOYSTICK_THRESHOLD) {

      queuedDirX = 0;
      queuedDirY = 1;

    }
    else if (dy > JOYSTICK_THRESHOLD) {

      queuedDirX = 0;
      queuedDirY = -1;

    }

  }

}

bool soundHasPriority(SoundType sound) {

  return (
    sound == SOUND_DEATH ||
    sound == SOUND_WIN
  );

}

void startSound(SoundType sound) {

  if (
    currentSound != SOUND_NONE &&
    sound == SOUND_WAKA &&
    soundHasPriority(currentSound)
  ) {
    return;
  }

  currentSound = sound;

  soundStartTime = millis();
  lastSoundStep = millis();

  if (sound == SOUND_DEATH) {
    soundFrequency = 1200;
  }

}

void stopSound() {

  ledcWriteTone(BUZZER, 0);

  currentSound = SOUND_NONE;

}

void updateSound() {

  unsigned long now = millis();

  switch (currentSound) {

    case SOUND_NONE:
      return;

    case SOUND_WAKA:

      if (now - soundStartTime < 25) {

        ledcWriteTone(BUZZER, 900);

      }
      else if (now - soundStartTime < 50) {

        ledcWriteTone(BUZZER, 650);

      }
      else {

        stopSound();

      }

      break;

    case SOUND_DEATH:

      if (now - lastSoundStep >= 25) {

        soundFrequency -= 55;

        lastSoundStep = now;

      }

      if (
        soundFrequency <= 120 ||
        now - soundStartTime > 700
      ) {

        stopSound();

      }
      else {

        ledcWriteTone(
          BUZZER,
          soundFrequency
        );

      }

      break;

    case SOUND_WIN: {

      unsigned long elapsed =
        now - soundStartTime;

      if (elapsed < 120) {

        ledcWriteTone(BUZZER, 700);

      }
      else if (elapsed < 240) {

        ledcWriteTone(BUZZER, 900);

      }
      else if (elapsed < 360) {

        ledcWriteTone(BUZZER, 1100);

      }
      else if (elapsed < 520) {

        ledcWriteTone(BUZZER, 1500);

      }
      else {

        stopSound();

      }

      break;
    }

  }

}

void handleShortPress() {

  switch (gameState) {

    case GAME_MENU:

      resetGame();

      gameState = GAME_READY;
      stateStartTime = millis();

      break;

    case GAME_PLAYING:

      gameState = GAME_PAUSED;
      stopSound();

      break;

    case GAME_PAUSED:

      gameState = GAME_PLAYING;

      break;

    case GAME_WIN:
    case GAME_OVER:

      resetGame();

      gameState = GAME_READY;
      stateStartTime = millis();

      break;

    default:
      break;

  }

}

void handleButton() {

  bool reading = digitalRead(JOY_SW);

  if (reading != lastButtonReading) {

    lastDebounceTime = millis();

  }

  if (
    millis() - lastDebounceTime >
    BUTTON_DEBOUNCE
  ) {

    if (reading != buttonState) {

      buttonState = reading;

      if (buttonState == LOW) {

        buttonPressTime = millis();
        longPressTriggered = false;

      }
      else {

        unsigned long pressDuration =
          millis() - buttonPressTime;

        if (
          !longPressTriggered &&
          pressDuration < LONG_PRESS_TIME
        ) {

          handleShortPress();

        }

      }

    }

  }

  if (
    buttonState == LOW &&
    !longPressTriggered &&
    millis() - buttonPressTime >= LONG_PRESS_TIME
  ) {

    longPressTriggered = true;

    stopSound();

    resetGame();

    gameState = GAME_READY;
    stateStartTime = millis();

  }

  lastButtonReading = reading;

}

bool nearCenter(Entity e) {

  return (
    fabs(e.x - round(e.x)) < 0.08f &&
    fabs(e.y - round(e.y)) < 0.08f
  );

}

bool canMove(
  Entity e,
  int dirX,
  int dirY
) {

  int nextX =
    round(e.x + dirX * 0.51f);

  int nextY =
    round(e.y + dirY * 0.51f);

  return !wallAt(
    nextX,
    nextY
  );

}

void resetPositions() {

  pac = {
    1,
    1,
    1,
    0
  };

  ghost1 = {
    14,
    1,
    -1,
    0
  };

  ghost2 = {
    14,
    5,
    -1,
    0
  };

  queuedDirX = 1;
  queuedDirY = 0;

}

void resetGame() {

  score = 0;
  lives = 3;

  resetPositions();
  copyMaze();

}

void movePac() {

  readJoystickQueue();

  if (nearCenter(pac)) {

    pac.x = round(pac.x);
    pac.y = round(pac.y);

    if (
      canMove(
        pac,
        queuedDirX,
        queuedDirY
      )
    ) {

      pac.dirX = queuedDirX;
      pac.dirY = queuedDirY;

    }

  }

  if (
    canMove(
      pac,
      pac.dirX,
      pac.dirY
    )
  ) {

    pac.x += pac.dirX * PAC_SPEED;
    pac.y += pac.dirY * PAC_SPEED;

  }

  int tileX = round(pac.x);
  int tileY = round(pac.y);

  if (mapData[tileY][tileX] == '.') {

    mapData[tileY][tileX] = ' ';

    score += 10;
    pelletsRemaining--;

    startSound(SOUND_WAKA);

    if (pelletsRemaining <= 0) {

      gameState = GAME_WIN;
      stateStartTime = millis();

      startSound(SOUND_WIN);

    }

  }

}

void chooseGhostDirection(
  Entity &ghost,
  int targetX,
  int targetY
) {

  if (!nearCenter(ghost)) {
    return;
  }

  ghost.x = round(ghost.x);
  ghost.y = round(ghost.y);

  int options[4][2] = {
    { 1, 0 },
    { -1, 0 },
    { 0, 1 },
    { 0, -1 }
  };

  int bestDistance = 9999;

  int bestDirX = ghost.dirX;
  int bestDirY = ghost.dirY;

  bool foundAlternative = false;

  for (int pass = 0; pass < 2; pass++) {

    for (int i = 0; i < 4; i++) {

      int dx = options[i][0];
      int dy = options[i][1];

      int nextX =
        round(ghost.x) + dx;

      int nextY =
        round(ghost.y) + dy;

      if (wallAt(nextX, nextY)) {
        continue;
      }

      bool reverse =
        dx == -ghost.dirX &&
        dy == -ghost.dirY;

      if (pass == 0 && reverse) {
        continue;
      }

      int distance =
        abs(nextX - targetX) +
        abs(nextY - targetY);

      if (distance < bestDistance) {

        bestDistance = distance;

        bestDirX = dx;
        bestDirY = dy;

        foundAlternative = true;

      }

    }

    if (foundAlternative) {
      break;
    }

  }

  ghost.dirX = bestDirX;
  ghost.dirY = bestDirY;

}

void moveGhostChaser(Entity &ghost) {

  chooseGhostDirection(
    ghost,
    round(pac.x),
    round(pac.y)
  );

  if (
    canMove(
      ghost,
      ghost.dirX,
      ghost.dirY
    )
  ) {

    ghost.x += ghost.dirX * GHOST_SPEED;
    ghost.y += ghost.dirY * GHOST_SPEED;

  }

}

void moveGhostAmbusher(Entity &ghost) {

  int targetX =
    round(pac.x) +
    pac.dirX * 3;

  int targetY =
    round(pac.y) +
    pac.dirY * 3;

  targetX = constrain(
    targetX,
    1,
    MAZE_WIDTH - 2
  );

  targetY = constrain(
    targetY,
    1,
    MAZE_HEIGHT - 2
  );

  chooseGhostDirection(
    ghost,
    targetX,
    targetY
  );

  if (
    canMove(
      ghost,
      ghost.dirX,
      ghost.dirY
    )
  ) {

    ghost.x += ghost.dirX * GHOST_SPEED;
    ghost.y += ghost.dirY * GHOST_SPEED;

  }

}

bool hitGhost() {

  float distance1 = sqrt(
    pow(pac.x - ghost1.x, 2) +
    pow(pac.y - ghost1.y, 2)
  );

  float distance2 = sqrt(
    pow(pac.x - ghost2.x, 2) +
    pow(pac.y - ghost2.y, 2)
  );

  return (
    distance1 < 0.55f ||
    distance2 < 0.55f
  );

}

void handleDeath() {

  lives--;

  startSound(SOUND_DEATH);

  gameState = GAME_DYING;
  stateStartTime = millis();

}

void drawHUD() {

  u8g2.setFont(
    u8g2_font_5x8_tf
  );

  char buffer[20];

  sprintf(
    buffer,
    "S:%04d",
    score
  );

  u8g2.drawStr(
    2,
    7,
    buffer
  );

  for (int i = 0; i < lives; i++) {

    int x =
      104 + i * 8;

    u8g2.drawDisc(
      x,
      4,
      3
    );

    u8g2.setDrawColor(0);

    u8g2.drawTriangle(
      x,
      4,
      x + 4,
      1,
      x + 4,
      7
    );

    u8g2.setDrawColor(1);

  }

  u8g2.drawHLine(
    0,
    8,
    SCREEN_WIDTH
  );

}

void drawMaze() {

  for (
    int y = 0;
    y < MAZE_HEIGHT;
    y++
  ) {

    for (
      int x = 0;
      x < MAZE_WIDTH;
      x++
    ) {

      int screenY =
        HUD_HEIGHT +
        y * TILE_SIZE;

      if (
        mapData[y][x] == '#'
      ) {

        u8g2.drawBox(
          x * TILE_SIZE,
          screenY,
          TILE_SIZE,
          TILE_SIZE
        );

      }
      else if (
        mapData[y][x] == '.' &&
        pelletVisible
      ) {

        u8g2.drawDisc(
          x * TILE_SIZE + 4,
          screenY + 4,
          1
        );

      }

    }

  }

}

void drawPac() {

  int x =
    round(pac.x * TILE_SIZE);

  int y =
    HUD_HEIGHT +
    round(pac.y * TILE_SIZE);

  if (!mouthOpen) {

    u8g2.drawXBMP(
      x,
      y,
      8,
      8,
      pacClosed
    );

    return;

  }

  const unsigned char* sprite =
    pacOpenRight;

  if (pac.dirX > 0) {

    sprite = pacOpenRight;

  }
  else if (pac.dirX < 0) {

    sprite = pacOpenLeft;

  }
  else if (pac.dirY < 0) {

    sprite = pacOpenUp;

  }
  else if (pac.dirY > 0) {

    sprite = pacOpenDown;

  }

  u8g2.drawXBMP(
    x,
    y,
    8,
    8,
    sprite
  );

}

void drawGhost(
  Entity ghost,
  const unsigned char* sprite
) {

  int x =
    round(
      ghost.x * TILE_SIZE
    );

  int y =
    HUD_HEIGHT +
    round(
      ghost.y * TILE_SIZE
    );

  u8g2.drawXBMP(
    x,
    y,
    8,
    8,
    sprite
  );

}

void drawDeathAnimation() {

  drawHUD();
  drawMaze();

  unsigned long elapsed =
    millis() - stateStartTime;

  int phase =
    elapsed / 120;

  int x =
    round(
      pac.x * TILE_SIZE
    );

  int y =
    HUD_HEIGHT +
    round(
      pac.y * TILE_SIZE
    );

  drawGhost(
    ghost1,
    ghostSprite1
  );

  drawGhost(
    ghost2,
    ghostSprite2
  );

  if (phase == 0) {

    u8g2.drawDisc(
      x + 4,
      y + 4,
      4
    );

  }
  else if (phase == 1) {

    u8g2.drawCircle(
      x + 4,
      y + 4,
      4
    );

  }
  else if (phase == 2) {

    u8g2.drawCircle(
      x + 4,
      y + 4,
      3
    );

  }
  else if (phase == 3) {

    u8g2.drawDisc(
      x + 4,
      y + 4,
      2
    );

  }

}

void drawMenu() {

  u8g2.setFont(
    u8g2_font_logisoso16_tf
  );

  u8g2.drawStr(
    22,
    24,
    "PAC-MAN"
  );

  u8g2.setFont(
    u8g2_font_6x10_tf
  );

  u8g2.drawStr(
    25,
    42,
    "ESP32 EDITION"
  );

  if (
    (millis() / 500) % 2 == 0
  ) {

    u8g2.drawStr(
      18,
      60,
      "PRESS BUTTON"
    );

  }

}

void drawReady() {

  drawHUD();
  drawMaze();
  drawPac();

  drawGhost(
    ghost1,
    ghostSprite1
  );

  drawGhost(
    ghost2,
    ghostSprite2
  );

  u8g2.setDrawColor(0);

  u8g2.drawBox(
    30,
    27,
    68,
    14
  );

  u8g2.setDrawColor(1);

  u8g2.setFont(
    u8g2_font_6x13_tf
  );

  u8g2.drawStr(
    42,
    39,
    "READY!"
  );

}

void drawPause() {

  drawHUD();
  drawMaze();
  drawPac();

  drawGhost(
    ghost1,
    ghostSprite1
  );

  drawGhost(
    ghost2,
    ghostSprite2
  );

  u8g2.setDrawColor(0);

  u8g2.drawBox(
    26,
    27,
    76,
    14
  );

  u8g2.setDrawColor(1);

  u8g2.setFont(
    u8g2_font_6x13_tf
  );

  u8g2.drawStr(
    38,
    39,
    "PAUSED"
  );

}

void drawWin() {

  u8g2.setFont(
    u8g2_font_logisoso16_tf
  );

  u8g2.drawStr(
    24,
    25,
    "YOU WIN!"
  );

  u8g2.setFont(
    u8g2_font_6x10_tf
  );

  char buffer[20];

  sprintf(
    buffer,
    "SCORE %d",
    score
  );

  u8g2.drawStr(
    38,
    45,
    buffer
  );

  u8g2.drawStr(
    18,
    60,
    "PRESS TO RESTART"
  );

}

void drawGameOver() {

  u8g2.setFont(
    u8g2_font_logisoso16_tf
  );

  u8g2.drawStr(
    17,
    25,
    "GAME OVER"
  );

  u8g2.setFont(
    u8g2_font_6x10_tf
  );

  char buffer[20];

  sprintf(
    buffer,
    "SCORE %d",
    score
  );

  u8g2.drawStr(
    38,
    45,
    buffer
  );

  u8g2.drawStr(
    18,
    60,
    "PRESS TO RESTART"
  );

}

void updateGame() {

  unsigned long now = millis();

  if (
    now - lastPacMove >=
    PAC_MOVE_INTERVAL
  ) {

    movePac();

    lastPacMove = now;

  }

  if (
    now - lastGhostMove >=
    GHOST_MOVE_INTERVAL
  ) {

    moveGhostChaser(
      ghost1
    );

    moveGhostAmbusher(
      ghost2
    );

    lastGhostMove = now;

  }

  if (
    gameState == GAME_PLAYING &&
    hitGhost()
  ) {

    handleDeath();

  }

}

void updateAnimations() {

  if (
    millis() - lastAnimation >=
    ANIMATION_INTERVAL
  ) {

    mouthOpen = !mouthOpen;
    pelletVisible = !pelletVisible;

    lastAnimation = millis();

  }

}

void setup() {

  u8g2.begin();

  pinMode(
    JOY_SW,
    INPUT_PULLUP
  );

  analogReadResolution(12);

  analogSetAttenuation(
    ADC_11db
  );

  ledcAttach(
    BUZZER,
    5000,
    8
  );

  calibrateJoystick();

  resetGame();

}

void loop() {

  handleButton();

  updateAnimations();
  updateSound();

  switch (gameState) {

    case GAME_READY:

      if (
        millis() -
        stateStartTime >=
        READY_DURATION
      ) {

        gameState =
          GAME_PLAYING;

      }

      break;

    case GAME_PLAYING:

      updateGame();

      break;

    case GAME_DYING:

      if (
        millis() -
        stateStartTime >=
        DEATH_DURATION
      ) {

        if (lives <= 0) {

          gameState =
            GAME_OVER;

        }
        else {

          resetPositions();

          gameState =
            GAME_READY;

          stateStartTime =
            millis();

        }

      }

      break;

    default:
      break;

  }

  u8g2.clearBuffer();

  switch (gameState) {

    case GAME_MENU:

      drawMenu();

      break;

    case GAME_READY:

      drawReady();

      break;

    case GAME_PLAYING:

      drawHUD();
      drawMaze();
      drawPac();

      drawGhost(
        ghost1,
        ghostSprite1
      );

      drawGhost(
        ghost2,
        ghostSprite2
      );

      break;

    case GAME_PAUSED:

      drawPause();

      break;

    case GAME_DYING:

      drawDeathAnimation();

      break;

    case GAME_WIN:

      drawWin();

      break;

    case GAME_OVER:

      drawGameOver();

      break;

  }

  u8g2.sendBuffer();

}

How to Play

When the ESP32 starts, the game displays:

PAC-MAN

ESP32 EDITION

PRESS BUTTON

Press the joystick button to start.

Controls

Control| Action
Joystick Up| Move up
Joystick Down| Move down
Joystick Left| Move left
Joystick Right| Move right
Short button press| Pause / Resume
Long button press| Restart

The objective is simple: collect every pellet while avoiding the ghosts.

Each pellet is worth 10 points and the game starts with three lives.

Troubleshooting

The OLED Is Blank

Check:

- SDA → GPIO 21
- SCL → GPIO 22
- VCC → 5V
- GND → GND

The Wokwi OLED uses I2C address "0x3C".

If you're using a physical display, check the exact module specifications because some SSD1306 boards use a different address or wiring arrangement.

For more OLED troubleshooting, see our [ESP32 OLED Tutorial]({{ '/esp32-oled-tutorial-wiring-code-display-guide/' | relative_url }}).

Pac-Man Moves Without Touching the Joystick

Make sure the joystick is completely centred when the ESP32 starts.

The firmware automatically calibrates the centre position during startup.

If necessary, increase:

#define JOYSTICK_THRESHOLD 700

to create a larger dead zone.

Joystick Directions Are Reversed

Different joystick modules and physical orientations can produce different axis directions.

If necessary, invert the corresponding direction in "readJoystickQueue()".

The Buzzer Does Not Produce Sound

Check:

Buzzer → GPIO 13
Buzzer → GND

The project uses the ESP32 LEDC peripheral and "ledcWriteTone()" to generate the audio.

Pac-Man Gets Stuck

If you modify the maze, make sure the maze remains exactly:

16 columns × 7 rows

and that the corridors connect correctly.

The collision system treats every "#" as a wall.

Ideas for Improving the Game

This version is intentionally small, but the architecture makes it easy to expand.

Add Power Pellets

Special pellets could temporarily make the ghosts vulnerable.

Add More Ghosts

A third ghost could use random movement while a fourth could patrol a fixed area.

Add Multiple Levels

After collecting all pellets, a new maze could be loaded.

Each level could increase ghost speed or introduce a more difficult maze.

Add High Scores

The ESP32 could store the highest score in non-volatile memory.

Improve the Maze Graphics

The current walls use simple filled blocks.

A future version could use custom bitmap graphics for:

- Rounded corners
- Maze borders
- Ghost eyes
- Power pellets
- Animated effects

Add a Start Countdown

Instead of immediately entering the game after "READY!", the display could show:

3
2
1
GO!

Add Ghost Modes

A more advanced version could implement:

- Chase mode
- Scatter mode
- Frightened mode
- Respawn mode

This would bring the game logic closer to classic arcade behaviour.

Why This Is a Good ESP32 Project

This project is more than a simple OLED animation.

It combines several important embedded programming concepts in a single application.

The ESP32 handles:

Joystick
   ↓
Input processing
   ↓
Game logic
   ↓
Collision detection
   ↓
AI
   ↓
Graphics
   ↓
Sound

Each part can be developed independently and then combined into the final game.

This makes the project particularly useful for learning how larger Arduino and ESP32 applications are structured.

Conclusion

Building a Pac-Man game on an ESP32 is a fun way to learn how hardware and software interact in an embedded system.

The project combines an ESP32, SSD1306 OLED, KY-023 joystick and passive buzzer to create a complete playable game with graphics, sound, enemy AI, scoring and multiple game states.

More importantly, the techniques used here are reusable.

The same tile-based system can be used to create:

- Snake
- Maze games
- Space shooters
- Platform games
- Puzzle games
- Menu interfaces

The joystick calibration can be reused in robotics and control projects, while the "millis()"-based timing architecture is useful in almost every interactive ESP32 application.

If you want to experiment with the project before building the hardware, start with the "ESP32 Pac-Man Wokwi simulation" (https://wokwi.com/projects/462408214673176577).

For more joystick-related projects, see the [ESP32 KY-023 Joystick Tutorial]({{ '/esp32-Joystick-Tutorial-Read-an-Analog-Joystick-%28KY-023%29-with-Arduino-IDE/' | relative_url }}), and for more OLED projects, see our [ESP32 OLED Tutorial]({{ '/esp32-oled-tutorial-wiring-code-display-guide/' | relative_url }}).
