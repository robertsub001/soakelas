const express = require('express');
const morgan = require('morgan');
const path = require('path');
const fs = require('fs');
const app = express();
const mysql = require("mysql");

var conn = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "minggu7_soa_senin"
});

const accessLogStream = fs.createWriteStream(path.join(__dirname, 'access.log'), { flags: 'a' });

app.use(express.urlencoded({extended:true}));
app.use(express.json());
app.use(morgan('dev', { stream: accessLogStream }));

app.post("/api/registerUser",(req,res)=>{
    let email = req.body.email;
    let nama = req.body.nama;
    let tipe = req.body.tipe;
    let password = req.body.password;
    let saldo = req.body.saldo;
    if(email.length == 0 || nama.length == 0 || tipe.length == 0 || password.length == 0 || saldo.length == 0){
        res.send("Tidak semua field terisi");
    }
    else{
        let apiKey = Math.floor(Math.random() * 8999999999) + 1000000000;
        conn.query(`select * from user where email_user = '${email}' or api_key = '${apiKey}'`,(err,rows)=>{
            if(err)console.log(err);
            else if(rows.length != 0) res.send("email kembar /api key sudah ada coba register lgi biar kerandom ulang");
            else {
                conn.query(`insert into user values('${email}','${password}','${nama}','${saldo}','${apiKey}','${tipe}')`,(err,rows)=>{
                    if(err) console.log(err);
                    else res.send({"apiKey:":apiKey});
                })
            }
        })
    }
    
})

app.post("/api/topup",(req,res)=>{
    let email = req.body.email;
    let topup = req.body.topup;
    conn.query(`select * from user where email_user = '${email}'`,(err,rows)=>{
        if(err)console.log(err);
        else if(rows.length == 0 ) res.send("email tidak ditemukan");
        else{
            let saldoBaru = rows[0].saldo_user + topup;
            conn.query(`update user set saldo_user ='${saldoBaru}' where email_user = '${email}'`,(err,rows)=>{
                if(err)console.log(err);
                else res.send("Topup berhasil");
            })
        }
    })
})

app.post("/api/subscribeAPI",(req,res)=>{
    let email = req.body.email;
    conn.query(`select * from user where email_user = '${email}'`,(err,rows)=>{
        if(err)console.log(err);
        else if(rows.length == 0 ) res.send("email tidak ditemukan");
        else{
            if(rows[0].tipe_user == 1) res.send("SUDAH SUBSCRIBE");
            else if(rows[0].saldo_user < 150000) res.send("Saldo tidak cukup");
            else{
                let saldoBaru = rows[0].saldo_user - 150000;
                conn.query(`update user set saldo_user ='${saldoBaru}', tipe_user='1' where email_user ='${email}'`,(err,rows)=>{
                    if(err)console.log(err);
                    else res.send("SUBSCRIBE BERHASIL");
                })
            }
        }
    })
})

app.post("/api/addLaporan",(req,res)=>{
    let judul = req.body.judul;
    let jenisLaporan = req.body.jenisLaporan;
    let deskripsi = req.body.deskripsi;
    let jenisBarang = req.body.jenisBarang;
    let alamat = req.body.alamat;
    let tanggal = req.body.tanggal;
    let kodepos = req.body.kodepos;
    let email = req.body.email;
    let apiKey = req.query.apiKey;
    if(apiKey == null) res.send("API KEY HARUS ADA");
    else{
        conn.query(`select * from user where api_key = '${apiKey}'`,(err,rows)=>{
            if(err)console.log(err);
            else if(rows.length == 0) res.send("user dengan api key tersebut tidak ditemukan");
            else{
                conn.query(`insert into laporan_lostfound values('','${judul}','${jenisLaporan}','${deskripsi}','${jenisBarang}','${alamat}','${tanggal}','${kodepos}','${email}')`,(err,rows)=>{
                    if(err) console.log(err);
                    else res.send("LAPORAN BERHASIL DITAMBAHKAN");
                })
            }
        })
    }
})

app.get("/api/getKelurahan",(req,res)=>{
    let apikey = req.query.apiKey;
    let zipcode = req.query.zip_code;
    if(zipcode == null) zipcode = "";
    let kecamatan = req.query.nama_kecamatan;
    if(kecamatan == null) kecamatan = "";
    if(apikey == null) res.send("Harus ada api key");
    else{
        conn.query(`Select * from user where api_key = '${apikey}'`,(err,rows)=>{
            if(err) console.log(err);
            else if(rows.length == 0) res.send("api key salah");
            else{
                conn.query(`select * from kelurahan where kecamatan like '%${kecamatan}%' and kode_pos like '%${zipcode}%'`,(err,rows)=>{
                    if(err) console.log(err);
                    else if(rows.length == 0) res.send("TIDAK DITEMUKAN KELURAHAN DENGAN KRITERIA");
                    else res.send(rows);
                })
            }
        })
    }
})

app.get("/api/searchLaporan",(req,res)=>{
    let apikey = req.query.apiKey;
    let jenisL = req.query.jenis_laporan;
    if(jenisL == null) jenisL = "";
    let zipcode = req.query.zip_code;
    if(zipcode == null) zipcode = "";
    let jenisB = req.query.jenis_barang;
    if(jenisB == null) jenisB = "";
    if(apikey == null) res.send("Harus ada api key");
    else{
        conn.query(`Select * from user where api_key = '${apikey}'`,(err,rows)=>{
            if(err) console.log(err);
            else if(rows.length == 0) res.send("api key salah");
            else if(rows[0].tipe_user == 0) res.send("Hanya yang sudah subscribe yang bisa pake");
            else{
                conn.query(`select * from laporan_lostfound where jenis_laporan like '%${jenisL}%' and kode_pos_alamat like '%${zipcode}%' and jenis_barang like '%${jenisB}%'`,(err,rows)=>{
                    if(err) console.log(err);
                    else if(rows.length == 0) res.send("TIDAK DITEMUKAN LAPORAN DENGAN KRITERIA");
                    else res.send(rows);
                })
            }
        })
    }

})

app.get('/', (req, res)=>{
    res.send('hello');
});

const port = process.env.port || 3000;
app.listen(port);
console.log('server listening port '+port+'...');