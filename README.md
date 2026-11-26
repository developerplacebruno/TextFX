# TextFX
Visual effects for text with customization support in Roblox.

## Effects

- **Counting**: Gradually changes the number in a text. Example of use: currency display and stopwatch.
```luau
TextFX.Counting(label, 0, { prefix = "$" })
task.wait(2)
TextFX.Counting(label, 5, { prefix = "$" })
```

- **Typewriter**: Displays the text gradually, in the style of a typewriter. Example of use: notification, tutorial, and dialogue.
```luau
TextFX.Typewriter(label, "Collect $10!")
task.wait(2)
TextFX.Typewriter(label, "Buy a egg!")
```
