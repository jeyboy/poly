module DSL
  class Content < Base
    def method_missing name, *args, &block
      name.downcase!
      if name.present? && name =~ /^[a-z]/

      end
    end
  end
end

#<!--...--> 	Defines a comment
#<!DOCTYPE>  	Defines the document type
#<a> 	Defines a hyperlink
#<abbr> 	Defines an abbreviation
#<acronym> 	Not supported in HTML5. Defines an acronym
#<address> 	Defines contact information for the author/owner of a document
#<applet> 	Not supported in HTML5. Deprecated in HTML 4.01. Defines an embedded applet
#<area> 	Defines an area inside an image-map
#<article>New 	Defines an article
#<aside>New 	Defines content aside from the page content
#<audio>New 	Defines sound content
#<b> 	Defines bold text
#<base> 	Specifies the base URL/target for all relative URLs in a document
#<basefont> 	Not supported in HTML5. Deprecated in HTML 4.01. Specifies a default color, size, and font for all text in a document
#<bdi>New 	Isolates a part of text that might be formatted in a different direction from other text outside it
#<bdo> 	Overrides the current text direction
#<big> 	Not supported in HTML5. Defines big text
#<blockquote> 	Defines a section that is quoted from another source
#<body> 	Defines the document's body
#<br> 	Defines a single line break
#<button> 	Defines a clickable button
#<canvas>New 	Used to draw graphics, on the fly, via scripting (usually JavaScript)
#<caption> 	Defines a table caption
#<cite> 	Defines the title of a work
#<code> 	Defines a piece of computer code
#<col> 	Specifies column properties for each column within a <colgroup> element
#<colgroup> 	Specifies a group of one or more columns in a table for formatting
#<command>New 	Defines a command button that a user can invoke
#<datalist>New 	Specifies a list of pre-defined options for input controls
#<dd> 	Defines a description/value of a term in a description list
#<del> 	Defines text that has been deleted from a document
#<details>New 	Defines additional details that the user can view or hide
#<dfn> 	Defines a definition term
#<dialog>New 	Defines a dialog box or window
#<dir> 	Not supported in HTML5. Deprecated in HTML 4.01. Defines a directory list
#<div> 	Defines a section in a document
#<dl> 	Defines a description list
#<dt> 	Defines a term/name in a description list
#<em> 	Defines emphasized text
#<embed>New 	Defines a container for an external (non-HTML) application
#<fieldset> 	Groups related elements in a form
#<figcaption>New 	Defines a caption for a <figure> element
#<figure>New 	Specifies self-contained content
#<font> 	Not supported in HTML5. Deprecated in HTML 4.01. Defines font, color, and size for text
#<footer>New 	Defines a footer for a document or section
#<form> 	Defines an HTML form for user input
#<frame> 	Not supported in HTML5. Defines a window (a frame) in a frameset
#<frameset> 	Not supported in HTML5. Defines a set of frames
#<h1> to <h6> 	Defines HTML headings
#<head> 	Defines information about the document
#<header>New 	Defines a header for a document or section
#<hr> 	Defines a thematic change in the content
#<html> 	Defines the root of an HTML document
#<i> 	Defines a part of text in an alternate voice or mood
#<iframe> 	Defines an inline frame
#<img> 	Defines an image
#<input> 	Defines an input control
#<ins> 	Defines a text that has been inserted into a document
#<kbd> 	Defines keyboard input
#<keygen>New 	Defines a key-pair generator field (for forms)
#<label> 	Defines a label for an <input> element
#<legend> 	Defines a caption for a <fieldset> element
#<li> 	Defines a list item
#<link> 	Defines the relationship between a document and an external resource (most used to link to style sheets)
#<map> 	Defines a client-side image-map
#<mark>New 	Defines marked/highlighted text
#<menu> 	Defines a list/menu of commands
#<meta> 	Defines metadata about an HTML document
#<meter>New 	Defines a scalar measurement within a known range (a gauge)
#<nav>New 	Defines navigation links
#<noframes> 	Not supported in HTML5. Defines an alternate content for users that do not support frames
#<noscript> 	Defines an alternate content for users that do not support client-side scripts
#<object> 	Defines an embedded object
#<ol> 	Defines an ordered list
#<optgroup> 	Defines a group of related options in a drop-down list
#<option> 	Defines an option in a drop-down list
#<output>New 	Defines the result of a calculation
#<p> 	Defines a paragraph
#<param> 	Defines a parameter for an object
#<pre> 	Defines preformatted text
#<progress>New 	Represents the progress of a task
#<q> 	Defines a short quotation
#<rp>New 	Defines what to show in browsers that do not support ruby annotations
#<rt>New 	Defines an explanation/pronunciation of characters (for East Asian typography)
#<ruby>New 	Defines a ruby annotation (for East Asian typography)
#<s> 	Defines text that is no longer correct
#<samp> 	Defines sample output from a computer program
#<script> 	Defines a client-side script
#<section>New 	Defines a section in a document
#<select> 	Defines a drop-down list
#<small> 	Defines smaller text
#<source>New 	Defines multiple media resources for media elements (<video> and <audio>)
#<span> 	Defines a section in a document
#<strike> 	Not supported in HTML5. Deprecated in HTML 4.01. Defines strikethrough text
#<strong> 	Defines important text
#<style> 	Defines style information for a document
#<sub> 	Defines subscripted text
#<summary>New 	Defines a visible heading for a <details> element
#<sup> 	Defines superscripted text
#<table> 	Defines a table
#<tbody> 	Groups the body content in a table
#<td> 	Defines a cell in a table
#<textarea> 	Defines a multiline input control (text area)
#<tfoot> 	Groups the footer content in a table
#<th> 	Defines a header cell in a table
#<thead> 	Groups the header content in a table
#<time>New 	Defines a date/time
#<title> 	Defines a title for the document
#<tr> 	Defines a row in a table
#<track>New 	Defines text tracks for media elements (<video> and <audio>)
#<tt> 	Not supported in HTML5. Defines teletype text
#<u> 	Defines text that should be stylistically different from normal text
#<ul> 	Defines an unordered list
#<var> 	Defines a variable
#<video>New 	Defines a video or movie
#<wbr>New 	Defines a possible line-break
