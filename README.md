# Shout System

Enhance roleplay with animated shouts and sound effects in FiveM.

## Features

- Shout command with customizable sound and animation
- Broadcasts messages to nearby players within a configurable distance

## Requirements

- FiveM server with ESX framework
- MySQL database

## Installation

1. Download the script files
2. Place them in your FiveM server's resources folder
3. Add `start shout-system` to your server.cfg

## Usage

- Players can use the `/shout` command to shout a message
- The message will be displayed to nearby players with a sound and animation

## Configuration

- `Config.ShoutCommand`: The command to use for shouting (default: 'shout')
- `Config.ShoutDistance`: The distance within which players will hear the shout (default: 10.0)
- `Config.ShoutSound`: The sound to play when shouting (default: 'shout')
- `Config.ShoutAnimation`: The animation to play when shouting (default: 'rcmepsilonism8')
- `Config.ShoutDuration`: The duration of the shout animation in milliseconds (default: 5000)

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=shout-system&utm_content=bottom) — describe it in one sentence and get the full source code.