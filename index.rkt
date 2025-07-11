#lang at-exp racket/base

(require scribble/html/html
         scribble/html/xml
         scribble/reader
         racket/string)

;;Cite the following.
;;
;;1. https://prl.khoury.northeastern.edu/blog/2017/05/23/building-a-website-with-scribble/
;;2. https://docs.racket-lang.org/scribble-pp/html.html
;;3. https://www.kiragoldner.com/blog/websites.html
;;4. https://github.com/nanopass/nanopass.github.io
;;5. https://fxdpntthm.github.io/
;;6. https://spencermortensen.com/articles/email-obfuscation/#text

;;;; Helpers

(define (commas . strs)
  (string-join strs ", "))

(define (unwords . strs)
  (string-join strs " "))

(define (equals key val)
  (string-append key "=" val))

;;;; Head

(define viewport_
  (meta 'name: "viewport" 'content: (commas (equals "width" "device-width") (equals "initial-scale" "1"))))

(define stylesheet_
  (link 'rel: "stylesheet" 'href: "./css/main.css"))

(define charset_
  (meta 'charset: "utf-8"))

(define title_
  @title{Kartik's Home Page})

(define head_
  (head charset_ viewport_ stylesheet_ title_))

;;;; Body

(define name_
  @h1['class: "centered"]{Kartik Sabharwal})

(define photo_
  (img 'src: "./images/kartik.jpg" 'height: "150" 'class: "photo"))

(define email_
  @p['class: (unwords "email" "centered")]{kartik-@span{middle-}sabharwal@"@"@span{uiowa}.edu})

(define github_
  (p 'class: "centered" 
     (let ([url "https://github.com/kartik-sabharwal"])
       (a 'href: url url))))

(define iowa_
  @p['class: "justified"]{I am a Ph.D. student at the University of Iowa's @a['href: "https://clc.cs.uiowa.edu/site/"]{Computational Logic Center} where I have the good fortune to be supervised by @a['href: "https://homepage.cs.uiowa.edu/~tinelli/"]{Professor Cesare Tinelli} and @a['href: "https://homepage.cs.uiowa.edu/~ajreynol/"]{Dr. Andrew Reynolds} as I explore ways to improve support for automated induction, conjecture generation and quantifier instantiation in the SMT solver @a['href: "https://cvc5.github.io"]{cvc5}.})

(define indiana_
  @p['class: "justified"]{I received my M.S. in Computer Science at Indiana University Bloomington and am thankful for the company and support of the faculty and students of the @a['href: "https://luddy.indiana.edu/research/centers/center-programming-systems.html"]{Center for Programming Systems} as well as the @a['href: "https://wonks.github.io/"]{PL Wonks} group.  I am especially grateful to @a['href: "https://homes.luddy.indiana.edu/samth/"]{Professor Sam Tobin-Hochstadt} for supervising my master's thesis on leveraging techniques from automated theorem proving for subtyping in @a['href: "https://docs.racket-lang.org/ts-guide/index.html"]{Typed Racket}.})

(define cmu_
  @p['class: "justified"]{My dual interests in automated theorem proving and programming languages were kindled by interactions with the instructors and students at Carnegie Mellon University where I earned a B.S. in Mathematical Sciences.})

(define scribble_
  @element["footer"]{I made this website with @a['style: "color: gray;" 'href: "https://docs.racket-lang.org/scribble-pp/html.html"]{scribble/html}})

(define body_
  (body name_ photo_ email_ github_ iowa_ indiana_ cmu_ scribble_))

;;;; Print document

(define (main)
  (output-xml
   (list
    (doctype 'html)
    (html 'lang: "en" head_ body_))))

(module+ main
  (main))
