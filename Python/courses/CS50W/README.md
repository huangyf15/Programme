# CS50W: Web Programming with Python and JavaScript

## Structure

* Web page
  * HTML5: structure
  * CSS3: style 
* Version control
  * Git: version
* Web application
  * Python/Django: logic
  * SQL/Models/Migrations: data
  * JavaScript/JSON: user interface
* Testing
  * CI/CD
* Scalability and Security

## Web page (`html/`, `css/`)

### Specificity of CSS

1. inline
2. id
3. class
4. type

### Efficient CSS tools

* Bootstrap: Popular CSS library
* Sass: Extension language of CSS

## Web application: logic (`django/`)

### HTTP Status Codes

* 200: OK
* 301: Moved Permanently
* 403: Forbidden
* 404: Not Found
* 500: Internal Server Error

## Web application: user interface (`js/`)

See `hello.html`, `counter.html`, `tasks.html`, `colors.html`, `currency.html`.

### Basic Concepts

* DOM: Document Object Model
* JSON: JavaScript Object Notation
* API: Application Programming Interface

### Web Events

* `onclick`, `onchange`
* `onmouseover`
* `onkeyup`, `onkeydown`
* `onload`, `onblur`
* ...

### Single-Page Applications

See `singlepage.html`, `scroll.html`, `animate.html`, `react.html`, `counter1.html`, `addition.html`.

#### Scroll

* `window.innerWidth`, `window.innerHeight`, `window.scrollY`
* `document.body.offsetHeight`

#### Animation

* `style.animationPlayState`
* `style.animation-name`, `style.animation-duration`, `style.animation-fill-mode`, `style.animation-iteration-count`
* `@keyframes` in `style`

#### Efficient JS packages

* `React`: define the components and how they behave
* `ReactDOM`: take the `react` components into the DOM
* `Babel`: convert `jsx` to `js`

##### Two of the Programming Paradigms

* Imperative Programming
  * View
  ```html
  <h1>0</h1>
  ```
  * Logic: 
  ```javascript
  let num = parseInt(document.querySelector("h1").innerHTML);
  num += 1;
  document.querySelector("h1").innerHTML = num;
  ```
* Declarative Programming
  * View
  ```html
  <h1>{num}</h1>
  ```
  * Logic: 
  ```javascript
  num += 1;
  ```