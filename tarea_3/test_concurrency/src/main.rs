use rand::Rng;
use std::sync::Arc;
use rayon::prelude::*;

/*
    Las reglas de borrowing de rust tienden a provocar 
    código muy ofuscado para para escribir memoria 
    concurrentementem así que usamos la librería rayon 
    que ofrece facilidades de paralelismo 
*/

const SIZE : usize = 10;

fn main() {
    let mut m1 = [[0i32; SIZE]; SIZE];
    let mut m2 = [[0i32; SIZE]; SIZE];
    
    let mut output = [[0i32; SIZE]; SIZE];
    let mut rng = rand::thread_rng();
    
    // fill matrix 
    for i in 0..SIZE {
        for j in 0..SIZE {
            m1[i][j] =  (rng.gen::<i32>() % 10).abs();
            m2[i][j] = (rng.gen::<i32>() % 10).abs();
        }
    }

    // compute in parallel
    let m1 = Arc::new(m1);
    let m2 = Arc::new(m2);

    output.par_iter_mut()
          .enumerate()
          .for_each(|(row_num, row)| {
            for i in 0..SIZE {
                row[i] = m1[row_num][i] + m2[row_num][i];
            }
          });

    println!("Primera matrix: ");

    for i in 0..SIZE{
        for j in 0..SIZE {
            print!("{} ", m1[i][j]);
        }
        println!("");
    }

    println!("Segunda matrix: ");
    for i in 0..SIZE{
        for j in 0..SIZE {
            print!("{} ", m2[i][j]);
        }
        println!("");
    }

    println!("Resultado: ");
    for i in 0..SIZE{
        for j in 0..SIZE {
            print!("{} ", output[i][j]);
        }
        println!("");
    }

}