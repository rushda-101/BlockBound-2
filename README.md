# BlockBound - Game Design Document

## 1. Project Overview/Game Concept
- Title: BlockBound
- Genre: 2D Platformer
- Platform: PC
- Engine: Godot
- Programming Language: GDScript
- Target Audience: Casual and intermediate players who enjoy skill-based progression games.

BlockBound is a three-level 2D platformer inspired by classic games such as Super Mario Bros. The player navigates through a digital world, collecting coins while avoiding hazards in order to reach the level exit. Each level increases in difficulty through tighter platform spacing, greater hazards and more complex traversal challenges.

The design prioritises mechanical clarity, progressive challenge and reward-driven engagement.

## 2. User and System Requirements (Scrum Style)

### 2.1 User Requirements
User requirements are defined using Scrum-style user stories to reflect player needs.

Core Gameplay Requirements:
* US1 – Movement: 
  As a player, I want to move left and right using WASD so that I can navigate the environment.
* US2 – Jumping: 
  As a player, I want to jump onto platforms so that I can traverse vertical spaces.
* US3 – Coin Collection: 
  As a player, I want to collect coins so that I am rewarded for exploration and skillful movement.
* US4 – Hazard Interaction: 
  As a player, I want hazards to reduce my lives on contact so that the game feels challenging.
* US5 – Lives System: 
  As a player, I want a limited number of lives so that success requires skill and precision.
* US6 – Level Progression: 
  As a player, I want to progress through increasingly difficult levels so that the game remains engaging.
* US7 – Level Completion: 
  As a player, I want a clear goal point so that I understand how to complete each level.

### 2.2 System Requirements
The system must:
* Detect and process WASD input.
* Apply gravity and physics using Godot’s built-in physics engine.
* Remove coins upon collection.
* Update and display score dynamically.
* Track and decrement lives.
* Reset player position upon life loss.
* Transition between Level 1, Level 2 and Level 3.
* Trigger Game Over state when lives reach zero.

  Detect collision between:
  * Player and platforms
  * Player and coins
  * Player and hazards

### 2.3 Prioritisation (MoSCoW Method)
Must have:
* Player movement and jump
* Collision detection
* Gravity physics
* Coin collection system
* Hazard system
* Lives system
* Three complete levels
* Level transition system

Should have:
* Score UI
* Level indicator
* Game Over screen

Could have:
* Sound effects
* Animated coins
* Background music

This prioritisation ensures the core gameplay loop is completed before polish features.

## 3. Scrum Backlog
| ID | Feature | Description | Acceptance Criteria | Priority |
|----|---------|-------------|---------------------|----------|
|B1|Player Controller|Implement movement & jumping|Player moves smoothly and responds instantly to input|Must|
|B2|Gravity System|Apply gravity physics|Player falls naturally and lands correctly|Must|
|B3|Platform Collision|Solid ground detection|Player cannot pass through platforms|Must|
|B4|Coin System|Collectible objects|Coin disappears and score increases|Must|
|B5|Hazard System|Damage zones|Player loses one life on contact|Must|
|B6|Lives System|Life tracking|Lives decrement correctly and trigger Game Over at zero|Must|
|B7|Level 1|Introductory stage|Playable from start to finish|Must|
|B8|Level 2|Intermediate difficulty|Noticeably harder than Level 1|Must|
|B9|Level 3|Advanced difficulty|Requires precise movement|Must|
|B10|Level Transition|Scene change system|Completing level loads next scene|Must|
|B11|UI Display|Score and lives|UI updates correctly during gameplay|Should|

Each backlog item is considered complete only when it satisfies functional testing and playtesting evaluation.

## 4. Research, Planning & Design

### 4.1 Overall Design Strategy
BlockBound adopts a progressive difficulty scaling model, a common structure within 2D platformers. Research into classic platform game design, particularly early side-scrolling platformers such as Super Mario Bros, demonstrates that difficulty is most effectively introduced gradually through spatial design rather than sudden mechanical complexity.
Game design literature on player engagement suggests that maintaining player motivation requires balancing challenge and ability (often described in Flow Theory). Based on this principle, BlockBound maintains consistent core mechanics (movement and jump) while increasing environmental complexity across levels.

Difficulty progression is therefore implemented through:
* Reduced platform size
* Increased hazard frequency
* Risk-reward coin placement
* Tighter jump timing

This ensures mechanical consistency while increasing player mastery requirements.

### 4.2 Game Story
Research into modern indie platformers indicates that excessive narrative can distract from gameplay-focused experiences. Therefore, BlockBound adopts a minimalist environmental narrative approach, inspired by digital-themed indie titles and arcade-era platformers.

The player is trapped within a fragmented digital simulation composed of block structures. Each level represents increasing difficulty and increased thought processing within the gameplay. By collecting coins and reaching the exit portal, the player stabilises each sector and progresses toward escape.

The narrative is minimalistic to keep focus on gameplay mechanics.

### 4.3 Level Design
Level design in platform games traditionally follows a structured teaching model:
1. Introduce mechanic safely
2. Reinforce mechanic with variation
3. Combine mechanics under pressure

This structure is widely observed in early platformers and continues in modern design practice.

#### Level 1 – Introduction
* Wide platforms
* Minimal hazards
* Safe coin placement
* Low punishment

Purpose:
* Teach core mechanics
* Allow player experimentation
* Establish control familiarity

This aligns with research on onboarding design, where early success builds player confidence.

#### Level 2 – Escalation
* Reduced platform width
* Increased verticality
* Hazards positioned between jumps
* Moderate risk coin placement

Purpose:
* Increase precision requirement
* Encourage careful movement
* Reinforce learned mechanics under pressure

This stage reflects the “skill consolidation” phase in progressive level design.

#### Level 3 – Mastery
* Small landing zones
* Clustered hazards
* Limited safe recovery space
* High-risk coin placement

Purpose:
* Demand mastery of timing and positioning
* Increase cognitive load
* Reward experienced players

Research into difficulty curves suggests that final levels should test mechanical fluency rather than introduce new mechanics, ensuring fairness and avoiding frustration.

### 4.4 Gameplay Loop
The gameplay loop is structured around a classic reward-feedback cycle:
Navigate → Avoid hazards → Collect coins → Reach exit → Progress

Research into player motivation models highlights four key components:
* Player State – Active exploration
* Need – Survival & progression
* Challenge – Platform precision & hazard avoidance
* Reward – Score increase & level completion

Coins function as extrinsic rewards, reinforcing exploration behaviour. The lives system introduces tension, increasing perceived stakes without overwhelming difficulty.

This structure aligns with established reward-challenge loops used in arcade-style games.

### 4.5 Game Rules
Clear and consistent rules are fundamental to perceived fairness in games. Research into player retention indicates that predictable rule systems reduce frustration.

BlockBound follows consistent rule logic:
* Player begins with 3 lives.
* Hazard contact reduces 1 life.
* Player respawns at level start.
* Falling below map boundary results in life loss.
* Game ends at 0 lives.
* Level completion triggered by reaching exit object.

No hidden mechanics are introduced across levels. All hazards behave consistently to preserve fairness.

### 4.6 System Architecture
BlockBound is developed using Godot due to research into engine suitability for 2D platform development.

Godot provides:
* Built-in physics engine
* Native collision detection
* Scene-based architecture
* TileMap support for efficient level design
* Lightweight project structure

Research comparing custom-coded physics engines versus built-in physics systems suggests that using established engines reduces implementation risk and increases stability, particularly within limited development timeframes.

#### Architectural Design
Scenes:
* Main Menu
* Level 1
* Level 2
* Level 3
* Game Over

Scripts:
* Player.gd
* Coin.gd
* Hazard.gd
* GameManager.gd

Node Types:
* CharacterBody2D (Player)
* Area2D (Coins & Hazards)
* TileMap (Level Layout)
* CanvasLayer (UI)

This modular architecture follows separation-of-concerns principles, improving maintainability and scalability.

### 4.7 State Diagram
The game follows a finite state model:
<img width="361" height="551" alt="BlockBound State Diagram drawio" src="https://github.com/user-attachments/assets/45a103eb-e46c-4efd-8b83-909786528a2b" />

Finite State Machines (FSMs) are widely used in game architecture research due to their clarity and predictability. Implementing structured state transitions reduces logic errors and improves debugging efficiency.

### 4.8 Technical Challenges
Based on research into common 2D platform development issues, anticipated challenges include:
* Preventing unintended double-jumping
* Fine-tuning gravity for natural movement feel
* Ensuring collision boundaries are accurate
* Managing scene transitions without variable loss
* Balancing difficulty progression

Mitigation strategies:
* Use Godot’s built-in physics methods (move_and_slide)
* Implement grounded checks for jump control
* Conduct iterative playtesting
* Use version control for rollback safety

This proactive risk identification demonstrates structured development planning.

## 5. Project Management

### 5.1 Development Methodology
BlockBound will be developed using an adapted Agile methodology inspired by Scrum principles. Coding development was structured into three weekly sprints, each with clearly defined objectives aligned to backlog priorities.

Core backlog items were identified at project initiation and categorised using the MoSCoW prioritisation model (Must, Should, Could). These items formed the basis of sprint planning and progress tracking.

Each week included:
* Sprint goal definition
* Task allocation from backlog
* Implementation phase
* Testing phase
* Backlog review
* Reflection and adjustment

This structured approach ensured steady progress while allowing flexibility for technical challenges.

### 5.2 Coding Development Timeline (3-Week Sprint Plan)
#### Week 1 – Core Mechanics & Foundation
Sprint Goal: Establish functional player movement and playable Level 1 prototype.

Planned Tasks:
* Learn core Godot systems and scene structure
* Implement player movement (WASD)
* Implement jump and gravity system
* Implement collision with platforms
* Build basic Level 1 TileMap layout

Focus Areas:
* Analysis: Understanding Godot physics system
* Design: Player controller architecture
* Coding: Movement and collision scripts
* Testing: Unit testing movement stability

#### Week 2 – Core Gameplay Systems
Sprint Goal: Implement interactive gameplay systems and expand level design.

Planned Tasks:
* Implement coin collection system
* Implement score tracking
* Implement hazard collision detection
* Implement lives system
* Implement respawn system
* Design and construct Level 2 and Level 3

Focus Areas:
* Design: Risk-reward coin placement
* Coding: Area2D detection & signal system
* Testing: Hazard and respawn reliability
* Difficulty balancing

#### Week 3 – Integration, Polish & Delivery
Sprint Goal: Complete full gameplay loop and finalise project.

Planned Tasks:
* Implement level transition system
* Implement Game Over state
* Add UI elements (score, lives display)
* Conduct full system testing
* Fix identified bugs
* Finalise documentation

Focus Areas:
* Integration testing
* Performance validation
* Difficulty tuning
* Final delivery preparation

### 5.3 Burndown Chart
A burndown chart was maintained throughout development to track remaining backlog items against time.

### 5.4 Backlog Reviews
At the end of each sprint, a backlog review session was conducted. This involved:
* Marking completed items as done
* Re-prioritising incomplete tasks
* Identifying new required tasks
* Assessing scope feasibility

Backlog reviews ensured that:
* Core gameplay features remained prioritised
* Scope creep was avoided
* Technical barriers were addressed early

This iterative evaluation supported controlled project progression and reduced implementation risk.

### 5.5 Development Review Meetings
Development review meetings were conducted weekly and documented to provide reflective evidence of progress. Each meeting addressed:
1. What was completed since the last review?
2. What will be completed in the next sprint?
3. What problems or barriers were encountered?
4. How were these resolved?
5. Were any backlog adjustments required?

#### Week 1 Review
Completed:
* Player movement and jump system
* Gravity and collision detection
* Basic Level 1 layout

Planned Next:
* Coin and hazard systems
* Lives implementation

Problems Encountered:

(Unintended double jumping
Jump arc felt unnatural)

Resolutions:

(Implemented grounded check using is_on_floor()
Adjusted gravity and jump velocity constants)

Backlog Impact:
* No scope changes

### 5.6 Risk Management
Potential risks identified at project initiation:
* Learning curve associated with Godot
* Physics tuning complexity
* Time constraints

Mitigation strategies included:
* Prioritising core mechanics early
* Avoiding advanced AI implementation
* Regular backlog review to prevent scope expansion
* Iterative testing after each feature implementation

## 6. Tools & Development Techniques
- Engine: Godot
- Language: GDScript
- Version Control: Git
- Development Method: Iterative Agile approach
- Design Approach: Modular scene architecture
- Programming Paradigm: Object-Oriented design

Code will follow separation of concerns principles to improve maintainability.

## 7. Testing Plan

### 7.1 Functional Testing
| Test ID | Feature | Action | Expected Outcome | Type | Pass/Fail | Further Actions |
|---------|---------|--------|------------------|------|-----------|-----------------|
|T1|Move Left|Press A|Player moves left smoothly|Unit|Fail|Edit the built-in actions instead of creating new ones <img width="1530" height="405" alt="Screenshot 2026-02-28 164554" src="https://github.com/user-attachments/assets/df8c2d62-ea28-4a72-9473-663ab1c39e72" />|
|**T1.1 (T1 Retest)**|Move Left|Press A|Player moves left smoothly|Unit|Pass <img width="1516" height="467" alt="Screenshot 2026-02-28 165037" src="https://github.com/user-attachments/assets/68d5eab8-3700-4f70-b2b5-78cdcc5a8fae" />|n/a|
|T2|Move Right|Press D|Player moves right smoothly|Unit|Pass|n/a|
|T3|Jump|Press W|Player jumps and lands correctly|Unit|Fail - Jump was not working when W was pressed|Add gravity concept into scene script - <img width="525" height="358" alt="image" src="https://github.com/user-attachments/assets/7f5881e8-e791-4730-ade9-e87e53c1a500" />|
|**T3.1 (T3 Retest)**|Jump|Press W|Player jumps and lands correctly|Unit|Pass <img width="315" height="349" alt="image" src="https://github.com/user-attachments/assets/e83ce812-c03a-4574-9e82-5e84c8fcddb3" />|n/a|
|T4|Gravity|Walk off platform|Player falls naturally|Unit|Pass <img width="1916" height="1005" alt="Screenshot 2026-03-01 203507" src="https://github.com/user-attachments/assets/b924ddec-a68b-4f58-a3f6-8715b3c4dd67" />|n/a|
|T5|Platform Collision|Land on platform|Player stands without clipping|Unit|Fail Player was falling straight to the ground|Make each individual platform it's own property so it possesses it's own attributes <img width="209" height="217" alt="image" src="https://github.com/user-attachments/assets/91074243-7bad-44bc-ac62-b18ec9b05491" />|
|**T5.1 (T5 Retest)**|Platform Collision|Land on platform|Player stands without clipping|Unit|Pass <img width="1915" height="1002" alt="Screenshot 2026-03-01 204657" src="https://github.com/user-attachments/assets/4d2a5bde-712d-4160-9c7d-3806643607c7" />|n/a|
|T6|Coin Collection|Touch coin|Coin disappears & score increases|Unit| | |
|T7|Hazard Collision|Touch hazard|Player loses one life|Unit| | |
|T8|Life Reduction|Trigger hazard 3 times|Game Over activates|Unit| | |
|T9|Respawn|Lose one life|Player respawns at level start|Unit| | |
|T10|Level Completion|Reach exit object|Next level loads|Integration| | |
|T11|Final Level Complete|Complete Level 3|Game Complete screen appears|Integration| | |
|T12|UI Update|Collect coin|Score updates instantly|Integration| | |
|T13|Lives UI|Lose life|Lives counter decreases correctly|Integration| | |

### 7.2 Boundary and Edge Case Testing
| Test ID | Scenario | Action | Expected Outcome | Pass/Fail | Further Actions |
|---------|----------|--------|------------------|-----------|-----------------|
|T1|Edge of Platform|Stand on platform edge|Player does not slide off unexpectedly| | |
|T2|Rapid JumpPress|Spam jump key|No unintended double jump|Pass|n/a|
|T3|Jump at Platform Edge|Jump partially off edge|Player behaves consistently| | |
|T4|Map Boundary Bottom|Fall below map|Life deducted & respawn| | |
|T5|Coin at Platform Edge|Collect near edge|Coin registers correctly| | |
|T6|Hazard Edge Contact|Slight contact with spike|Collision still triggers| | |
|T7|Simultaneous Coin + Hazard|Touch both at same time|Hazard takes priority| | |

### 7.3 Negative Testing (Unexpected Input)
| Test ID | Scenario | Action | Expected Outcome | Pass/Fail | Further Actions |
|---------|----------|--------|------------------|-----------|-----------------|
|T1|No Input|Player idle|Character remains stationary|Pass|n/a|
|T2|Press All Movement Keys|A + D simultaneously|No erratic movement|Pass|n/a|
|T3|Hold Jump Continuously|Hold W|Only single jump allowed|Pass|n/a|
|T4|Leave Game Idle|No interaction|No physics instability|Pass|n/a|
|T5|Restart After Game Over|Press restart|Game resets correctly| | |

### 7.4 Performance Testing
| Test ID | Scenario | Expected Outcome | Pass/Fail | Further Actions |
|---------|----------|------------------|-----------|-----------------|
|T1|Multiple Coins on Screen|No frame drop| | |
|T2|Rapid Input Changes|No stuttering| | |
|T3|Level Transition|Scene loads smoothly| | |
|T4|Long Play Session|No memory issues| | |
|T5|Full Game Completion|No crashes| | |
