# BlockBound - Game Design Document (Sprint 2)

## 1. Project Overview/Game Concept
- Title: BlockBound
- Genre: 2D Platformer
- Platform: PC
- Engine: Godot
- Programming Language: GDScript
- Target Audience: Casual and intermediate players who enjoy skill-based progression games.

BlockBound is a three-level 2D platformer inspired by classic games such as Super Mario Bros. The player navigates through a digital world, collecting coins while avoiding hazards in order to reach the level exit. Each level increases in difficulty through tighter platform spacing, greater hazards and more complex traversal challenges.

A Main Menu system was implemented to provide a structured entry point to the game. This allows players to start the game, view instructions, or exit the application before gameplay begins.

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
* US8 – Main Menu Navigation:
  As a player, I want a main menu so that I can start the game, view instructions, or exit easily.
* US9 – Instructions Access:
  As a player, I want to view instructions before playing so that I understand the controls and objectives.

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
* Load a Main Menu scene at game start
* Detect button input for Start, Instructions, and Quit
* Display and hide an instructions panel
* Transition from Main Menu to Level 1
* Exit the application when Quit is selected

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
* Main Menu screen
* Instructions panel

Could have:
* Sound effects
* Animated coins
* Background music

This prioritisation ensures the core gameplay loop is completed before polish features.

## 3. Scrum Backlog
| ID | Feature | Description | Acceptance Criteria | Priority | Story Points | Sprint | Status |
|----|---------|-------------|---------------------|----------|--------------|--------|--------|
|B1|Player Controller|Implement movement & jumping|Player moves smoothly and responds instantly to input|Must|5|Sprint 1|Done|
|B2|Gravity System|Apply gravity physics|Player falls naturally and lands correctly|Must|3|Sprint 1|Done|
|B3|Platform Collision|Solid ground detection|Player cannot pass through platforms|Must|5|Sprint 1|Done|
|B4|Coin System|Collectible objects|Coin disappears and score increases|Must|5|Sprint 1|Done|
|B5|Hazard System|Damage zones|Player loses one life on contact|Must|3|Sprint 1|Done|
|B6|Lives System|Life tracking|Lives decrement correctly and trigger Game Over at zero|Must|5|Sprint 1|Done|
|B7|Level 1|Introductory stage|Playable from start to finish|Must|3|Sprint 1|Done|
|B8|Level 2|Intermediate difficulty|Noticeably harder than Level 1|Must|5|Sprint 1|Done|
|B9|Level 3|Advanced difficulty|Requires precise movement|Must|5|Sprint 1|Done|
|B10|Level Transition|Scene change system|Completing level loads next scene|Must|3|Sprint 1|Done|
|B11|UI Display|Score and lives|UI updates correctly during gameplay|Should|3|Sprint 1|Done|
|B12|Main Menu|Entry screen with navigation options|Player can start game, view instructions, and quit|Should|5|Sprint 2|Done|
|B13|Instructions Panel|Display gameplay instructions|Instructions panel opens and closes correctly|Should|3|Sprint 2|Done|
|B14|Fade Transition|Visual polish|Smooth fade-in on load|Could|2|Sprint 2|Done|

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

Technical Implementation Details:
The project is implemented using Godot Engine, which provides a node-based architecture. Each scene is composed of reusable nodes that encapsulate behaviour and logic.

GDScript Implementation:
The game uses GDScript, a Python-like language optimised for rapid development within Godot.

Key implementation examples include:

Player Movement System
* Implemented using CharacterBody2D
* Movement handled via _physics_process(delta)
* Uses move_and_slide() for collision-aware motion

Signal-Based Architecture
* Coins emit a collected signal
* GameManager listens and updates score
* Promotes loose coupling between systems

Scene Management
* Scene transitions handled using: get_tree().change_scene_to_file()
* Ensures clean switching between levels and menu

UI System
* Built using Control nodes
* Uses visibility toggling for Instructions panel
* Layered using Canvas/UI hierarchy

Godot provides:
* Built-in physics engine
* Native collision detection
* Scene-based architecture
* TileMap support for efficient level design
* Lightweight project structure

Research comparing custom-coded physics engines versus built-in physics systems suggests that using established engines reduces implementation risk and increases stability, particularly within limited development timeframes.

Planned Flowcharts (Design Evidence):

To support system design, the following flowcharts will be included:
* Player Movement Logic Flowchart
* Game State Flowchart (Menu → Gameplay → Game Over / Win)
* UI Interaction Flowchart (Button Input → Action)

These diagrams visually represent logic flow and validate system structure.

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
* MainMenu.gd

Node Types:
* CharacterBody2D (Player)
* Area2D (Coins & Hazards)
* TileMap (Level Layout)
* CanvasLayer (UI)
* Control (Main Menu UI)
* Panel (Instructions display)
* TextureRect (Background image)
* AnimationPlayer (Fade transitions)

UI Components Added:
* Main Menu (Control node)
* Buttons (Start, Instructions, Quit)
* Instructions Panel (Panel node)
* Background (TextureRect)
* Fade system (ColorRect + AnimationPlayer)

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

#### Technical Challenges and Solutions
Several technical challenges were encountered during development:

1. Input Handling & Movement Precision
Issue: Unintended double jumping and inconsistent movement
Solution: Implemented is_on_floor() checks and refined velocity handling

2. UI System Complexity
Issue: Buttons and panels not responding due to incorrect node paths
Solution: Used structured node hierarchy and verified signal connections

3. Scene Transitions
Issue: Incorrect scene loading (e.g., Level 3 returning to Level 2)
Solution: Explicit scene referencing using correct file paths

4. Visual Feedback (Red Flash & Fade)
Issue: Effects not displaying due to incorrect node references or alpha values
Solution: Used modulate property and RGBA alpha adjustments

5. Node Referencing Errors
Issue: “null instance” errors when accessing nodes
Solution: Implemented get_node_or_null() for safer referencing

These challenges demonstrate iterative debugging and practical problem-solving within a game development environment.

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

### 5.2 Coding Development Timeline (Sprint 2 – Main Menu System)
#### Week 1 – Core Menu Structure
Sprint Goal: Establish a functional Main Menu scene with basic navigation.

Planned Tasks:
* Create Main Menu scene using Control node
* Implement layout using VBoxContainer
* Add buttons (Start, Instructions, Quit)
* Connect button signals
* Implement Start Game functionality (load Level 1)
* Implement Quit functionality

Focus Areas:
* Analysis: Understanding Godot UI system (Control nodes)
* Design: Menu layout and structure
* Coding: Scene setup and button signal connections
* Testing: Verify button functionality and scene transitions

#### Week 2 – Instructions System & UI Behaviour
Sprint Goal: Implement instructions panel and improve user interaction.

Planned Tasks:
* Create Instructions Panel (Panel node)
* Add instructional text (controls and objectives)
* Implement open/close functionality for Instructions
* Ensure panel visibility toggling works correctly
* Resolve UI layering issues (panel appearing above background)

Focus Areas:
* Design: Clear and readable instruction layout
* Coding: UI visibility logic and node referencing
* Testing: Validate panel display and interaction reliability

#### Week 3 – Visual Polish & User Experience
Sprint Goal: Enhance visual quality and overall user experience.

Planned Tasks:
* Add background image using TextureRect
* Implement fade-in transition using ColorRect and AnimationPlayer
* Refine layout positioning and alignment (centering UI elements)
* Ensure consistent visual hierarchy (background, buttons, panels)
* Conduct full testing of menu interactions

Focus Areas:
* Design: Visual presentation and layout balance
* Coding: Animation implementation
* Testing: Integration testing of full menu system
* Usability: Ensuring intuitive navigation and responsiveness

### 5.3 Burndown Chart (Sprint 2)
A burndown chart was maintained throughout development to track remaining backlog items against time.

<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/19f625a9-7009-4b42-837e-7044bdd2b6d7" />

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
Development review meetings were conducted weekly during Sprint 2 to track progress on the Main Menu implementation. Each review evaluated completed work, upcoming tasks, encountered issues, and resolutions. Each meeting addressed:
1. What was completed since the last review?
2. What will be completed in the next sprint?
3. What problems or barriers were encountered?
4. How were these resolved?
5. Were any backlog adjustments required?

#### Week 1 Review
Completed:
* Created Main Menu scene using Control node
* Implemented layout using VBoxContainer
* Added Start, Instructions and Quit buttons
* Connected button signals to corresponding functions
* Implemented scene transition to Level 1
* Implemented Quit functionality

Planned Next:
* Instructions panel implementation
* UI interaction improvements

Problems Encountered:
* Initial difficulty understanding Godot UI node hierarchy
* Button signals not triggering due to incorrect connections

Resolutions:
* Reviewed Control node structure and layout system
* Correctly connected signals using Node tab
* Verified functionality through testing

Backlog Impact:
* No changes required

#### Week 2 Review
Completed:
* Implemented Instructions Panel
* Added gameplay instructions (controls and objectives)
* Implemented open/close functionality for Instructions
* Ensured panel visibility toggling works correctly

Planned Next:
* Visual improvements (background and transitions)
* UI positioning and alignment

Problems Encountered:
* Instructions panel not appearing due to incorrect node path
* UI elements overlapping or appearing behind background

Resolutions:
* Corrected node paths using proper hierarchy references (get_node)
* Adjusted node order and layering to ensure visibility
* Verified panel display through testing

Backlog Impact:
* Minor UI refinement task added

#### Week 3 Review
Completed:
* Added background image using TextureRect
* Implemented fade-in transition using ColorRect and AnimationPlayer
* Improved UI layout and centering of elements
* Ensured consistent visual hierarchy
* Conducted full system testing of Main Menu

Planned Next:
* Final documentation updates
* Optional UI enhancements (if required)

Problems Encountered:
* Fade animation initially not visible due to incorrect alpha values
* UI elements not properly centered on screen

Resolutions:
* Adjusted RGBA alpha values for fade effect
* Used layout presets and containers to correctly align UI elements
* Retested transitions and visual behaviour

Backlog Status:
* All Sprint 2 tasks complete
* No outstanding issues

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

Godot was selected due to:
* Built-in 2D physics engine
* Node-based architecture (modular design)
* Integrated scripting environment
* Strong UI system for menus and overlays

Programming Approach:
* Object-Oriented design (separate scripts per entity)
* Event-driven programming using signals
* Modular scene architecture

Development Techniques:
* Iterative testing after each feature
* Debugging using print statements and error logs
* Use of reusable nodes and scenes

Code will follow separation of concerns principles to improve maintainability.

## 7. Testing Plan

#### Testing Strategy and Traceability
Testing was directly linked to user stories and acceptance criteria to ensure all functional requirements were validated.

For example:
* US1 (Movement) → Tested in T1 & T2
* US3 (Coin Collection) → Tested in T6
* US5 (Lives System) → Tested in T8
* US8 (Main Menu Navigation) → Tested in T15
* US9 (Instructions Access) → Tested in T17

This ensures traceability between requirements and testing, demonstrating that all user needs were fully validated.

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
|T6|Coin Collection|Touch coin|Coin disappears & score increases|Unit|Fail Player was touching coin but the coin was not dissapearing|Add seperate script to the game manager node <img width="212" height="221" alt="image" src="https://github.com/user-attachments/assets/2b87f779-81f9-4214-9d9b-af4f34ed9b98" />|
|**T6.1 (T6 Retest)**|Coin Collection|Touch coin|Coin disappears & score increases|Unit|Pass <img width="485" height="500" alt="image" src="https://github.com/user-attachments/assets/8446aa8a-0c75-4088-8a88-170b773b3b90" />|n/a|
|T7|Hazard Collision|Touch hazard|Player loses one life|Unit|Pass, However player was losing life even at a large distance from the spike|Change the player collision shape so it is not too big <img width="254" height="278" alt="Screenshot 2026-03-04 211134" src="https://github.com/user-attachments/assets/1abfe9bb-97a4-4af3-8553-34b900eac957" />|
|**T7.1 (T7 Retest)**|Hazard Collision|Touch hazard|Player loses one life|Unit|Pass <img width="1304" height="896" alt="Screenshot 2026-03-04 220532" src="https://github.com/user-attachments/assets/51041f1a-754a-4a18-a38e-8cfaab48da27" />|n/a|
|T8|Life Reduction|Trigger hazard 3 times|Game Over activates|Unit|Pass <img width="957" height="497" alt="image" src="https://github.com/user-attachments/assets/10f95f54-770b-4c25-81d5-9cf82747bedf" />|n/a|
|T9|Respawn|Lose one life|Player respawns at level start|Unit|Pass <img width="500" height="448" alt="image" src="https://github.com/user-attachments/assets/28927ff1-c9c6-450c-bed2-4375f09c4222" />|n/a|
|T10|Level Completion|Reach exit object|Next level loads|Integration|Pass <img width="1643" height="895" alt="Screenshot 2026-03-04 220609" src="https://github.com/user-attachments/assets/6f91ce04-6662-42c4-8270-e18ac0e02238" />|n/a|
|T11|Final Level Complete|Complete Level 3|Game Complete screen appears|Integration| | |
|T12|UI Update|Collect coin|Score updates instantly|Integration|Pass <img width="878" height="497" alt="image" src="https://github.com/user-attachments/assets/4d9ee020-a7a2-42f4-bc5e-154e787913b9" />|n/a|
|T13|Lives UI|Lose life|Lives counter decreases correctly|Integration|Pass <img width="500" height="448" alt="image" src="https://github.com/user-attachments/assets/3c3e6e1a-ad00-41a2-a2e2-e424b074e1dd" />|n/a|
|T14|Red Flash|Lose life|Player sprite flashed red when life is lost|Integration|Pass|n/a|
|T15|Main Menu Navigation|Click Start, Instructions, Quit|Correct scene loads, instructions display and game exits|Integration|Pass <img width="952" height="449" alt="image" src="https://github.com/user-attachments/assets/5f070ca8-0091-442b-a9a7-a04a5943bd6b" />|n/a|
|T16|Fade in transition|Open game|Fade in transition is displayed upon load for 1 second|Integration|Pass|n/a|
|T17|Instructions Panel|Open and close instructions|Panel appears and disappears correctly|Integration|Pass <img width="950" height="452" alt="image" src="https://github.com/user-attachments/assets/072a9852-378a-4575-a4ab-5b4838850c6e" />|n/a|

### 7.2 Boundary and Edge Case Testing
| Test ID | Scenario | Action | Expected Outcome | Pass/Fail | Further Actions |
|---------|----------|--------|------------------|-----------|-----------------|
|T1|Edge of Platform|Stand on platform edge|Player does not slide off unexpectedly|Pass <img width="204" height="407" alt="image" src="https://github.com/user-attachments/assets/883e5f26-7357-4750-931b-8bb43bff5c16" />|n/a|
|T2|Rapid JumpPress|Spam jump key|No unintended double jump|Pass|n/a|
|T3|Jump at Platform Edge|Jump partially off edge|Player behaves consistently|Pass <img width="580" height="648" alt="Screenshot 2026-03-01 235349" src="https://github.com/user-attachments/assets/bd7906c2-e3df-4cd9-8d42-c45742cb6495" />|n/a|
|T4|Map Boundary Bottom|Fall below map|Life deducted & respawn|Pass <img width="949" height="846" alt="Screenshot 2026-03-02 183622" src="https://github.com/user-attachments/assets/cc1505d7-7c9b-4743-8596-d65797781035" />|n/a|
|T5|Coin at Platform Edge|Collect near edge|Coin registers correctly|Pass <img width="1607" height="844" alt="Screenshot 2026-03-02 165815" src="https://github.com/user-attachments/assets/b0850218-9299-471e-aad0-cfac0d240d81" />|n/a|
|T6|Hazard Edge Contact|Slight contact with spike|Collision still triggers|Pass <img width="1304" height="896" alt="Screenshot 2026-03-04 220532" src="https://github.com/user-attachments/assets/76e00ec6-da42-4df3-93e5-907a84173717" />|n/a|

### 7.3 Negative Testing (Unexpected Input)
| Test ID | Scenario | Action | Expected Outcome | Pass/Fail | Further Actions |
|---------|----------|--------|------------------|-----------|-----------------|
|T1|No Input|Player idle|Character remains stationary|Pass|n/a|
|T2|Press All Movement Keys|A + D simultaneously|No erratic movement|Pass|n/a|
|T3|Hold Jump Continuously|Hold W|Only single jump allowed|Pass|n/a|
|T4|Leave Game Idle|No interaction|No physics instability|Pass|n/a|
|T5|Restart After Game Over|Press restart|Game resets correctly|Pass <img width="1914" height="993" alt="Screenshot 2026-03-02 185801" src="https://github.com/user-attachments/assets/66208b82-69bd-4629-8645-1c9ffc6e44e9" />|n/a|

### 7.4 Performance Testing
| Test ID | Scenario | Expected Outcome | Pass/Fail | Further Actions |
|---------|----------|------------------|-----------|-----------------|
|T1|Multiple Coins on Screen|No frame drop|Pass|n/a|
|T2|Rapid Input Changes|No stuttering|Pass|n/a|
|T3|Level Transition|Scene loads smoothly|Pass|n/a|
|T4|Long Play Session|No memory issues|Pass|n/a|
|T5|Full Game Completion|No crashes|Pass|n/a|
