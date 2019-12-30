# Introduction
This directory of files is for example HTML files, as well as some documentation to help with writing HTML. I find examples are much easier to work with than descrptions.

# Writing HTML

## Block Elements
In general you cannot put block elements inside other block elements. Well, you can but they will not always render as you expect. Common block elements are: `<p>`, `<table>`, `<form>`, `<ul>`, `<pre>`, `<div>`. See [Block-level elements - HTML: Hypertext Markup Language | MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Block-level_elements) for more details on this.

# General Tips

## Investigating Issues
If you find the page you made does not look quite as you wanted or exected then it is possible that the browser is processing your HTML in an unexpected way. When I experienced this I found that the browser was closing my tags where I did not expect it to.

Take the HTML page or even a file and open it in a browser. Then use the context menu on the area/element in question and use "Inspect", this will show you what the browser has produced in response to your HTML, if there is a difference, then you will need to start investigating further, possibly by reading documentation at [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/HTML).
