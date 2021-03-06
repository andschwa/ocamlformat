let () = [%ext expr] ; ()

let _ = (match%ext x with () -> ()) [@attr y]

let _ =
  match%ext x with () ->
    let y = [%test let x = y] in
    let%test x = d in
    d

val f : compare:[%compare : 'a] -> sexp_of:[%sexp_of : 'a] -> t

let invariant t =
  Invariant.invariant [%here] t [%sexp_of : t] (fun () ->
      assert (check_t_invariant t) )

;; [%e
     ? ( xxxxxxxxx
       , xxxxxxxxxxxxx
       , xxxxxxxxxxxxxxxx
       , xxxxxxxxxxxxxx
       , xxxxxxxxxxx
       , xxxxxxxxxxxxxxxxxxxx )]

;; [%e
     ? ( xxxxxxxxx
       , xxxxxxxxxxxxx
       , xxxxxxxxxxxxxxxx
       , xxxxxxxxxxxxxx
       , xxxxxxxxxxx
       , xxxxxxxxxxxxxxxxxxxx ) when a < b]


[%ext let f = () and g () = () in e]
(let%ext f = () and g () = () in e)


[%ext let rec f = () and g () = () in e]
(let%ext rec f = () and g () = () in e);;

let _ = ([%ext? (x:x)] : [%ext? (x:x)]);;


[%%ext
11111111111111111111]

[%%ext
11111111111111111111111 22222222222222222222222 33333333333333333333333]

[%%ext
;; 11111111111111111111

;; 22222222222222222222]

[%%ext
;; 11111111111111111111

;; 22222222222222222222

;; 33333333333333333333]


let _ = [%stri
  let [%p xxx] =
    fun (t : [%t tt]) (ut : [%t tt]) ->
      [%e xxx]]


let _ =
  [ x;
    x ---> [%expr [%e x ~loc [%expr x] x] ; iter tail]
    ;x]


let _ =
  [%expr let x = e in f y][@x]


let _ = f (for i = 0 to 1 do () done) (while true do () done)
let _ = f (for%ext i = 0 to 1 do () done) (while%ext true do () done)

let _ = function%ext x -> x

let _ = f (function%ext x -> x)

let _ = f (function%ext x -> x) x

let _ = [%ext function x -> x]

let _ = f [%ext function x -> x]

let _ = f [%ext function x -> x] x

let _ = f ([%ext e] [@attr]) x

let _ = a ;%ext b ; [%ext (a ; b)]

let _ =
  try%lwt Lwt.return 2
  with _ -> assert false

let _ =
  (* foooooooooooo *)
  try%lwt
    (* fooooooooooo *)
    Lwt.return 2
  with _ -> assert false

let _ =
  try%lwt
    let a = 3 in
    Lwt.return a
  with _ -> assert false

let _ =
  (* foooooooooooo *)
  try%lwt
    (* fooooooooooo *)
    let a = 3 in
    Lwt.return a
  with _ -> assert false

let%lwt f = function
  | _ -> ()

type%any_extension t =
  < a: 'a >
