+++
title = "CSS anchor linked element fade animation"
+++


This is a nice yellow fade effect on elements linked via on-page anchor improves [Human-computer interaction]({{< ref "Human-computer interaction" >}}) and generally gives better [UX]({{< ref "UX" >}}) compared to default disorienting anchor navigation.

```css
:target {
  animation: target-fade 3s 1;
}

@keyframes target-fade {
  0% { background-color: yellow; }
  100% { background-color: white; }
}
```