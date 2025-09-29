# Guide for the Tutorial Sheet Template

Hi all,

I’ve been working on some accessible Quarto-based templates for teaching resources. The easiest starting place was one-off sheets like tutorial/lab/bonus sheets, and since I have a working version I thought I’d share it in case anyone fancies using it to save them the work of styling and making their sheets easy for students to recognise and navigate for the coming semester.

I’ve packaged up the template onto GitHub so using it is now super easy. You just run:

```bash
quarto use template david-hodge/sheet
```

You will then be stepped through the install. Once done, you will be in a folder which contains template files `tutorial.qmd`, `lab.qmd`, and `bonus.qmd`. These are almost identical except for banner colour and wording. Each can be rendered immediately with Quarto.

The templates contain a banner, a few example questions, and some styled boxes, so you can concentrate on the actual content. The plan is that you just download the templates, rename `tutorial.qmd` to `tutorial1.qmd`, and then copy your existing content to replace the questions in `tutorial1.qmd`.

After editing the stuff at the top (like the title and banner), the only edit likely needed is to adjust the syntax for starting and ending a question, which looks like this:

```markdown
::: {.question}
## Question 3
Your question text goes here…
:::
```

That’s everything you need to get the template up and running. If you want to tweak things, look in the `_extensions` folder and navigate until you find the `scripts/` and `scss/` folders. If you want to change colours, see `_colours.scss` (defines named colours) and `_banner.scss` (controls tutorial/lab/bonus sheet styling).

For anyone very new to Quarto, **Positron** looks like a good editor/viewer to start with.

Enjoy!
David

---

## Summary of Template Contents

### 1️⃣ What’s inside?

| Section | Purpose |
|---------|---------|
| YAML header (`pagetitle`, `title-meta`, `format`) | Set the document title and choose output formats (HTML + PDF). Format needs to be `sheet-html`. |
| Banner code chunk (`make_banner()`) | Generates a consistent header with course code, visible sheet title, and a “last updated” line. |
| Red & blue boxes | Coloured boxes for deadlines, notes, or warnings. (See Section 2 for optional use.) |
| `.question` blocks | Demarcates where each question starts and ends. |
| Table & Figure examples | Syntax examples for tables, margin captions, and figures. |
| Extra filter (`scripts/hr-after-question.lua`) | Inserts a horizontal rule after every question block when rendering to HTML. |

---

### 2️⃣ Optional Banner Fields

The `last_updated` and `subtitle` arguments in `make_banner()` are optional. If you don’t want them, leave them empty:

```r
make_banner(
  type = "tutorial",
  last_updated = "",       # leave empty if not needed
  sheet_title = "Tutorial Sheet 3",
  subtitle = "",           # leave empty if not needed
  course_code = "STATS5678"
)
```

---

### 3️⃣ Red / Blue “Call-out” Boxes (Optional)

You can remove or comment out the deadline/info boxes:

```html
<!--
::: {.box .box-red}
## Submission deadline
…your deadline text…
:::
-->

<!--
::: {.box .box-blue}
## Information about the template
…your info text…
:::
-->
```

Commenting keeps the text in place but tells Quarto to ignore it during rendering.

---

### 4️⃣ Table & Figure Styling

- **Tables:** Use simple pipe syntax. Add a caption/label line immediately after the table.  
- **Figures:** The example R chunk demonstrates margin captions (`cap-location: margin`). Regular captions can be `top` or `bottom`. Always include alternative text.

---

### 5️⃣ Table of Contents (TOC)

Default options for the template:

```yaml
format:
  sheet-html: default
```

You can override defaults in your YAML. For example, to disable TOC:

```yaml
format:
  sheet-html:
    toc: false   # set to false if you don’t want a Table of Contents
```

---

### 6️⃣ Rendering the Sheet

- **HTML (recommended for preview & manual PDF conversion)**

```bash
quarto render tutorial.qmd
```

Open the resulting `.html` in Chrome/Chromium → Print → Save as PDF for cleanest output.

- **Direct PDF (LaTeX-based)**

```bash
quarto render tutorial.qmd --to pdf
```

Requires a TeX distribution. Margin captions may not work in pure LaTeX PDFs; HTML-to-PDF is usually better.

*Note* I have not added colour and box support for the LaTeX version, so it will be plain.

- **Both at once** (HTML + LaTeX PDF)

To render both simultaneously, add a `yaml pdf: default` format to the header and then run:

```bash
quarto render tutorial.qmd
```

> **Note:** Some browser-specific features may not render in LaTeX PDFs.

---

### 7️⃣ Sharing the Final Sheet

The template by default bundles all resources into one large html file. Should you wish the expanded version then set ```yaml embed-resources: false``` in the header.

- **Single-file Moodle upload:** By default the `embed-resources: true` bundles all CSS, JS, and images.  
- **TOC PDF link:** If you wish to include on the html page a link to the PDF version then first add `pdf: default` to the YAML header, this creates a PDF link below0 the Table of Contents. Then upload the PDF alongside the HTML as a Moodle multi-file package. Remove `pdf: default` to hide the PDF link.

