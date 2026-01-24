ERRATA

This is the list of all the fixes reported by readers after the initial release:

1. **Steve Harrison** noticed an issue with my usage of `data-turbo-permanent`. I used it to stop broadcasted page refreshes from closing new and edit forms. However it also prevented errors from being shown since it also prevents regular turbo frame updates. It also prevented the new form from being closed after submitting the ticket, since it was relying on page refresh. Steve correctly diagnosed the issue and suggested using a turbo stream action to close the new form. This has lead me to the current version using his suggestion and a custom `data-turbo-prevent-morph` attribute to prevent morphing while allowing turbo frame updates.
2. **Jeroen Versteeg** noticed that I incorrectly wrote that you need to add `= content_for :head` into the layout when it already exists by default. I was adding it to be able to use `turbo_refreshes_with` but Jeroen correctly pointed out that I just need to place the call above the existing `= yield :head`. He reported this in a PR: https://github.com/radanskoric/hotboard/pull/43

*Note that you cannot see fixes in repo history. This is because I keep the history in pristine state to match the chapters in the book. Whenever I need to make a change I run an interactive rebase and rewrite the repo history to match book progression. This keeps it clean and easy to follow for new readers. It makes changing anything much harder and obscures additional fixes but is the right tradeoff for a project accompanying a book.*

