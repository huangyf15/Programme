# CS50W: Web Programming with Python and JavaScript

## Structure

* Web page
  * HTML5: structure (`html/`)
  * CSS3: style  (`css/`)
* Web app
  * Python/Django: logic (`django/`)
  * SQL/Models/Migrations: data (`sql/`)
  * JavaScript/JSON: user interface (`js/`)
* Development
  * Version control: Git/GitHub
  * Testing and CI/CD: GitHub Actions; Docker (`test/`)
  * Scalability and Security
* Project (`project/`)

## Web page (`html/`, `css/`)

### Specificity of CSS

1. inline
2. id
3. class
4. type (tag)

### Efficient CSS tools

* Bootstrap: Popular CSS library
* Sass: Extension language of CSS

## Web app: logic (`django/`)

### HTTP Status Codes

* 200: OK
* 301: Moved Permanently
* 403: Forbidden
* 404: Not Found
* 500: Internal Server Error

## Web app: data (`sql`)

See `flights.sql`, `airline/`.

### Database Management Systems

* MySQL
  * SQL: Structured Query Language
  * Types: `CHAR(size)`, `VARCHAR(size)`, `SMALLINT`, `INT`, `BIGINT`, `FLOAT`, `DOUBLE`, ...
* PostgreSQL
* **SQLite**
  * Constraints: `CHECK`, `DEFAULT`, `NOT NULL`, `PRIMARY KEY`, `UNIQUE`, ...
  * Types: `TEXT`, `NUMERIC`, `INTEGER`, `REAL`, `BLOB`
  * Functions: `AVERAGE`, `COUNT`, `MAX`, `MIN`, `SUM`, ...
  * Queries: `CREATE TABLE`, `INSERT`, `SELECT`, `UPDATE`, `JOIN`, `CREATE INDEX`, ...
  * Clauses: `LIMIT`, `ORDER BY`, `GROUP BY`, `HAVING`, ...

#### `CREATE TABLE`

```sql
CREATE TABLE flights {
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  origin TEXT NOT NULL,
  destination TEXT NOT NULL,
  duration INTEGER NOT NULL
}
```

#### `INSERT`

```sql
INSERT INTO flights
  (origin, destination, duration)
  VALUES ("New York", "London", 415);
```

#### `SELECT`

```sql
SELECT * FROM flights;
SELECT origin, destination FROM flights;
SELECT * FROM flights WHERE id = 3;
```

#### `UPDATE`

```sql
UPDATE flights
  SET duration = 430
  WHERE origin = "New York"
  AND destination = "London";
```

#### `JOIN`

* `JOIN / INNER JOIN`
* `LEFT OUTER JOIN`
* `RIGHT OUTER JOIN`
* ``

```sql
SELECT first, origin, destination
FROM flights JOIN passengers
ON passengers.flight_id = flights.id;
```

#### `CREATE INDEX`

```sql
CREATE INDEX name_index ON passengers (last);
```

### Actions

* SQL Injection
* Race Condition

## Web app: user interface (`js/`)

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

### Efficient JS packages

* `React`: define the components and how they behave
* `ReactDOM`: take the `react` components into the DOM
* `Babel`: convert `jsx` to `js`

#### Two of the Programming Paradigms

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

## Testing and CI/CD (`test/`)

See `prime/`, `counter/`.

### Testing

* `shell` script
* `unittest` package (`python`)
  * Two types of testing
    * Django Testing: `django` test module (back-end, with `javascript`)
    * Browser Testing: `selenium` package (front-end)
  * `unittest` Methods
    * `assertEqual`, `assertNotEqual`
    * `assertTrue`, `assertFalse`
    * `assertIn`, `assertNotIn`
    * `assertIsNone`, `assertIsNotNone`
    * ...

### CI/CD

* CI: Continuous Integration
  * Frequent merges to main branch
  * Automated unit testing
* CD: Continuous Delivery
  * Short release schedules

#### Example

* GitHub Actions: YAML

`.github/workflow/ci.yml`:
```yml
name: Testing
on: push

jobs:
  test_project:
    runs-on: ubuntu-latest
    steps:
    - uses: action/checkout@v2
    - name: Run Django unit tests
      run: |
        pip3 install --user django
        python3 manage.py test
```
* Docker:
  * Infrastructure -> Host OS -> **Docker** -> *Container* [Bins/Libs -> App]
  * Infrastructure -> Hypervisor -> *VM* [Guest OS -> Bins/Libs -> App]

`docker-compose.yml`:
```yml
version: '3'

services:
  db:
    image: postgres

  web:
    build: .
    volumes:
      - .:/usr/src/app
    ports:
      - "8000:8000"
```
`Dockerfile`:
```dockerfile
FROM python:3
COPY .  /usr/src/app
WORKDIR /usr/src/app
RUN pip install -r requirements.txt
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
```

## Scalability and Security

### Scalability

* Type of Scaling
  * Vertical Scaling
  * Horizontal Scaling
* Servers
  * Cloud
  * On Premise
* Benchmarking

#### Load Balancing Methods

* Random Choice
* Round Robin
* Fewest Connections
* ...

#### Session-Aware Load Balancing

* Tricky Sessions
* Sessions in Database
* Client-Side Sessions
* ...

#### Autoscaling

### Security

#### Open-Source Software

