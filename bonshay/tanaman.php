<?php
// --- koneksi ke database
$koneksi = mysqli_connect("localhost","root","product","tanaman") or die(mysqli_error());
// --- Fungsi tambah data (Create)
function tambah($koneksi){
    
    // --- melakukan kondisi penyimpanan data
    if (isset($_POST['btn_simpan'])){
        $id = time();
        $nm_tanaman = $_POST['nm_tanaman'];
        $hasil = $_POST['harga'];
        $lama = $_POST['deskripsi'];
    
        // --- jika tanaman tidak kosong, maka data disimpan pada database tanaman
        if(!empty($nm_tanaman) && !empty($harga) && !empty($deskripsi)){
            $sql = "INSERT INTO tabel_panen (id,nama_tanaman, harga, deskripsi) VALUES(".$id.",'".$nm_tanaman."','".$harga."','".$deskripsi."')";
            $simpan = mysqli_query($koneksi, $sql);
            if($simpan && isset($_GET['aksi'])){ // melakukan aksi GET
                if($_GET['aksi'] == 'create'){ 
                    header('location: index.php');
                }
            }
        // --- jika penyimpanan data gagal
        } else {
            $pesan = "Tidak dapat menyimpan, data belum lengkap!";
        }
    }
    ?> 

     <form action="" method="POST">
            <fieldset>
                <legend><h2>Tambah data</h2></legend>
                <label>Nama tanaman <input type="text" name="nm_tanaman" /></label> <br>
                <label>Hasil panen <input type="number" name="harga" /> kg</label><br>
                <label>Lama tanam <input type="number" name="deskripsi" /> bulan</label> <br>
                <br>
                <label>
                    <input type="submit" name="btn_simpan" value="Simpan"/>
                    <input type="reset" name="reset" value="Hapus"/>
                </label>
                <br>
                <p><?php echo isset($pesan) ? $pesan : "" ?></p>
            </fieldset>
        </form>
    <?php
}
// --- Tutup Fngsi tambah data
// --- Fungsi Baca Data (Read)
function tampil_data($koneksi){
    $sql = "SELECT * FROM tabel_tanaman";
    $query = mysqli_query($koneksi, $sql);
    
    echo "<fieldset>";
    echo "<legend><h2>Data Panen</h2></legend>";
    
    echo "<table border='1' cellpadding='10'>";
    echo "<tr>
            <th>ID</th>
            <th>Nama Tanaman</th>
            <th>Harga</th>
            <th>Deskripsi</th>
            <th>Tindakan</th>
          </tr>";
    
    while($data = mysqli_fetch_array($query)){
        ?>
            <tr>
                <td><?php echo $data['id']; ?></td>
                <td><?php echo $data['nama_tanaman']; ?></td>
                <td><?php echo $data['harga']; ?> Kg</td>
                <td><?php echo $data['deskripsi']; ?> bulan</td>
                <td>
                    <a href="index.php?aksi=update&id=<?php echo $data['id']; ?>&nama=<?php echo $data['nama_tanaman']; ?>&hasil=<?php echo $data['harga']; ?>&lama=<?php echo $data['deskripsi']; ?>">Ubah</a> |
                    <a href="index.php?aksi=delete&id=<?php echo $data['id']; ?>">Hapus</a>
                </td>
            </tr>
        <?php
    }
    echo "</table>";
    echo "</fieldset>";
}
// --- Tutup Fungsi Baca Data (Read)
// --- Fungsi Ubah Data (Update)
function ubah($koneksi){
    // ubah data
    if(isset($_POST['btn_ubah'])){
        $id = $_POST['id'];
        $nm_tanaman = $_POST['nm_tanaman'];
        $hasil = $_POST['harga'];
        $lama = $_POST['deskripsi'];
        
        if(!empty($nm_tanaman) && !empty($harga) && !empty($deskripsi)){
            $perubahan = "nama_tanaman='".$nm_tanaman."',harga=".$harga.",deskripsi=".$deskripsi."'";
            $sql_update = "UPDATE tabel_panen SET ".$perubahan." WHERE id=$id";
            $update = mysqli_query($koneksi, $sql_update);
            if($update && isset($_GET['aksi'])){
                if($_GET['aksi'] == 'update'){
                    header('location: index.php');
                }
            }
        } else {
            $pesan = "Data tidak lengkap!";
        }
    }
    
    // tampilkan form ubah
    if(isset($_GET['id'])){
        ?>
            <a href="index.php"> &laquo; Home</a> | 
            <a href="index.php?aksi=create"> (+) Tambah Data</a>
            <hr>
            
            <form action="" method="POST">
            <fieldset>
                <legend><h2>Ubah data</h2></legend>
                <input type="hidden" name="id" value="<?php echo $_GET['id'] ?>"/>
                <label>Nama tanaman <input type="text" name="nm_tanaman" value="<?php echo $_GET['nama'] ?>"/></label> <br>
                <label>Harga <input type="number" name="harga" value="<?php echo $_GET['harga'] ?>"/>rp </label><br>
                <label>Deskripsi <input type="text" name="deksripsi" value="<?php echo $_GET['deskripsi'] ?>"/> </label> <br>
                <br>
                <label>
                    <input type="submit" name="btn_ubah" value="Simpan Perubahan"/> atau <a href="index.php?aksi=delete&id=<?php echo $_GET['id'] ?>"> (x) Hapus data ini</a>!
                </label>
                <br>
                <p><?php echo isset($pesan) ? $pesan : "" ?></p>
                
            </fieldset>
            </form>
        <?php
    }
    
}
// --- Tutup Fungsi Update
// --- Fungsi Delete
function hapus($koneksi){
    if(isset($_GET['id']) && isset($_GET['aksi'])){
        $id = $_GET['id'];
        $sql_hapus = "DELETE FROM tabel_panen WHERE id=" . $id;
        $hapus = mysqli_query($koneksi, $sql_hapus);
        
        if($hapus){
            if($_GET['aksi'] == 'delete'){
                header('location: index.php');
            }
        }
    }
    
}
// --- Tutup Fungsi Hapus
// ===================================================================
// --- Program Utama
if (isset($_GET['aksi'])){
    switch($_GET['aksi']){
        case "create":
            echo '<a href="index.php"> &laquo; Home</a>';
            tambah($koneksi);
            break;
        case "read":
            tampil_data($koneksi);
            break;
        case "update":
            ubah($koneksi);
            tampil_data($koneksi);
            break;
        case "delete":
            hapus($koneksi);
            break;
        default:
            echo "<h3>Aksi <i>".$_GET['aksi']."</i> tidaka ada!</h3>";
            tambah($koneksi);
            tampil_data($koneksi);
    }
} else {
    tambah($koneksi);
    tampil_data($koneksi);
}
?>
</body>
</html> 