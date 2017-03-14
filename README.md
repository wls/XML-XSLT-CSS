XML/XSL/CSS
===========
This is a simple demonstration file that shows
the separation of concerns for data, layout,
and presentation.

In essence, it generates an "html" web page
in the browser by providing information rather
than manually layout out a page.

The End Product
---------------
With all three files in the same directory,
open the .xml file in a browser.

What you _should_ see is a table with a green
header containing a list of books sorted by
title.

Now open the .xml file in a text editor, and
you'll see that's what's rendered looks nothing
like the contents of the .xml file.

We'll explore how we got this to happen.

XML
---
The XML file contains several elements: BOOKS, BOOK, TITLE, AUTHOR, ISBN, COMMENT ...  I made
all of them up.

The trick here is consistency of usage, and the
only objective was to _describe_ the data, not
how it would look.

More over, note the content isn't even sorted
in the XML file.  All that magic happens later
in the browser.

The magic line to pay attention to is:
    <?xml-stylesheet type="text/xsl" href="books.xsl"?>

This says once the XML file is loaded, perform
_transformations_ on it according to rules in the
XSL file.

XSL
---
This file performs _matching_ of XML elements and
constructs whatever output is desired.  In this case,
the output happens to be HTML.

Do not be deceived by the HTML you see, to the file it
is just raw text.  The stuff of interest are all the tags
within the `<xsl:...>` name-space.  You'll note there's
not many of them.

This file forms a template.  The `match="/"` causes this
section to be emitted at the root element.

It isn't until midway through we get to a
`<xsl:for-each ...>` statement, which walks over
selected elements.  In this case all the `BOOK` items
that are inside of the `BOOKS` element.

Additionally, there's also a `<xsl:sort ...>` directive
that indicates the resulting collection could be ordered
in `ascending` manner according to the child contents of
the `TITLE` element.

This loops over this section of the template, where we
inject values into the rendered template.  Using
`<xsl:value-of ...>`, the values from elements of the
currently iterated item are used.

And that's it.  An HTML file is built from the data.

Observe that our data had a `COMMENT` element, but we
opted to not use it here.

CSS
---
Note that part of the template is uses a style sheet:

    <link rel="StyleSheet" href="books.css" type="text/css" media="screen" />

Once the _data_ from the XML is put into the _HTML structure_ via the XSLT, it can now be rendered any
way we want.

The `body` element is presented in a given font,
the `table` element is assigned borders,
the `th` elements are colored green, and
the `td` is given its own padding and borders.

Things to try
-------------
Try adding more data to the XML file.

Change the sort field and direction (to descending) in
the XSLT file.

Restyle the elements.

And new fields to the data, modify the template, and
provide a rendering for them.

How is this useful
------------------
It's much easier to make a program export it's native
data that try to accomodate the display technology.

No special HTML knowledge or elements are needed, the
data describes just the data in a way that makes sense.

Remember how in the XSL section we completely omitted
the `COMMENT` field? The same data might be used for
different views.

We could also have a division of labor: the data folks
define custom data, the HTML gurus perform structured
markup which makes search engines happy, and the CSS
folks provide design decisions for preference and
device.

It becomes trivial to tell _what to display_ (XML),
_how it should be organized_ (XSLT), and _how it
should look_ (CSS).
