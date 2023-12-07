open Lwt.Infix

let read_file_lwt file_path =
  Lwt_io.open_file ~mode:Lwt_io.input file_path >>= fun channel ->
  let rec read_lines acc =
    Lwt_io.read_line_opt channel >>= function
    | Some line -> read_lines (acc ^ line ^ "\n")
    | None -> Lwt.return acc
  in
  read_lines "" >>= fun content ->
  Lwt_io.close channel >>= fun () ->
  Lwt.return content
;;

let () =
  let file_path = "example.txt" in
  let file_content = Lwt_main.run (read_file_lwt file_path) in
  Printf.printf "Content of %s:\n%s" file_path file_content;
