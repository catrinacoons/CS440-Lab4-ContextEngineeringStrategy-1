# Vacuum Robot Environment

## Problem
Implement the environment needed for a
reinforcement learning vacuum robot.

Q-learning will be implemented in a later lab.

## Grid
S   0   0   0
0   X   0   0
0   0   0   0
0  -1   0  10

## Known Information
- Grid size: 4x4
- Start: (0,0)
- Obstacle: (1,1)
- Penalty location: (3,1)
- Goal location: (3,3)

## Unknown Information
- Transition model T
- Complete reward function R
- Movement probabilities
- Invalid action behavior
- Terminal-state rules

## Constraints
- Do not implement Q-learning yet.
- Do not assume missing requirements.
- Separate confirmed facts from assumptions.