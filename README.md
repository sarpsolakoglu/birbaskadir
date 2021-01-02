# Bir Baskadir
Very Simple Interactive Story App built using SwiftUI

This was built as a gift for my partner for Christmas/New Years. Most of the effort went into gathering pictures and filling in the story rather than the code itself (which took around 30 minutes) but wanted to showcase how simple it is to get going with SwiftUI.

The name of the project and the images in this sample are from the Netflix show [Ethos](https://www.netflix.com/title/81106900).

![Demo](/demo.png)

## How to build your own Stroy.
Fill in `story.json` to form your story. Add images in the `Assets.xcassets` and reference them by name in the json.

```json
{ "pages":
    [
        {
            "id": "0",
            "content": [
                {
                    "type": "title",
                    "description": "Bir Baskadir"
                },
                {
                    "type": "image",
                    "description": "story0"
                },
                {
                    "type": "body",
                    "description": "Some body"
                }
            ],
            "options": [
                {
                    "text": "Good option.",
                    "linked_story_id": "1"
                },
                {
                    "text": "Bad option.",
                    "linked_story_id": "2"
                }
            ]
        }
    ]
}
```

The `content` part accepts only 3 types currently which is `title`, `image` and `body`. Can easily create more types that render differently in the UI. `options` part gets rendered into buttons that link to the next page with the id. Only special `linked_story_id` that there is currently is `back` which just goes back to previous page.
