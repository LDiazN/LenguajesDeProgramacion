use std::io;
use std::path::Path;
use std::fs;
use std::thread;

fn count_files(directory : &str) -> Result<usize, io::Error> {
    let mut count = 0;
    let mut handlers = vec![];
    
    // iterate over dir entries
    for file in fs::read_dir(directory)? {
        let file = file?;
        let path = file.path();

        // if not dir, just add 1
        if !path.is_dir() {
            count += 1;
            continue
        }

        // if dir, parallel count every other dir
        let handler = thread::spawn(move || {
            count_files(path.to_str().expect("no reconozco ese path")) // will crash if not valid unicode
        });

        handlers.push(handler);
    }

    for handler in handlers {
        let result = handler.join().expect("Error en uno de mis hijos")?;
        count += result;
    }

    Ok(count)
}


fn main() {

    // parse user input
    let mut dir_path = String::new();

    println!("Dame un directorio: ");
    io::stdin()
        .read_line(&mut dir_path)
        .expect("No pude leer input");


    // Now check if dir exists
    let dir_path = dir_path.trim_end();
    let path = Path::new(dir_path);
    if !path.is_dir() {
        eprintln!("Ese no es un directorio valido: {:?}", path);
    }

    // cuenta archivos
    println!("Hay {} archivos", count_files(dir_path).expect("Error contando archivos"));

}