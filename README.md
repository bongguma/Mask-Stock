# Mask-Stock

### ๐ ์์น๋ณ ๋ง์คํฌ ์ฌ๊ณ  ๊ฒ์ ์ฑ ๐
*๋ฐฑ์์ฉ URL์ ๋ง์คํฌ ์ฌ๊ณ  API๋ก ํ์ฉํ์ฌ ๋ง์คํฌ ์ฌ๊ณ ๋ฅผ ํ์ธํ๋ ์ฑ์ Flutter MVVMํจํด์ผ๋ก ๊ตฌํ*   

#### ์ฌ์ฉ๋  ๊ธฐ์ 
1. ๋ง์คํฌ ์ฌ๊ณ  API๋ฅผ ์ฌ์ฉํ  ์ ์๋๋ก HTTP ํต์ 
2. ์์น๋ฅผ ์ ๋ณด๋ฅผ ์ ๊ณตํ๋ ๊ธฐ์ 
3. Provider๋ฅผ ํ์ฉํ ์ํ ๊ด๋ฆฌ
4. ๊ตฌ๊ธ ์ง๋ ์คํ ๋ผ์ด๋ธ๋ฌ๋ฆฌ๋ฅผ ํ์ฉํ ๊ธฐ์ 

#### MVVM (Model - View - ViewModel) ํจํด
[View] - ์ฌ์ฉ์์๊ฒ ๋ณด์ฌ์ฃผ๋ UI ๋ถ๋ฌธ
          - ์ฌ์ฉ์์ ๋์์ด๋ ๊ฐ์ข ์ฒ๋ฆฌ๋ ViewModel์์ ์ด๋ฃจ์ด์ง๋ค.
[ViewModel] - Model์ View์ ํ์ํ๊ธฐ ์ํ ์ฒ๋ฆฌ๋ฅผ ํ๋ ๋ถ๋ฌธ
                - View๋ก ๋ถํฐ ๋ฏธ์ ๋ฐ์ ์ฒ๋ฆฌ๋ฅผ Model์๊ฒ ์ ๋ฌํด์ค ์ ์๋ค.
                - Model๋ก ๋ฐ์ ์ฒ๋ฆฌ ๊ฒฐ๊ณผ๋ฅผ View์ ์ ๋ฌํด์ค ์ ์๋ค.   
                
      _changeNotifer & chageNotiferProvider_
          - ViewModel ํด๋์ค๊ฐ changeNotifer๋ฅผ ์์์ ๋ฐ์ ์ฌ์ฉํด ๊ตฌํํ๊ณ  ์๋ค๋ฉด,
            View ์์์ ChangeNotiferProvider๋ฅผ ํตํด ๋ณ๊ฒฝ์ ์ด ๋ณ๊ฒฝ ์ ์์ ฏ์ด ๋ณ๊ฒฝ๋  ์ ์๋ค. 
            ViewModel๋ฅผ ๊ณตํต์ง์ด ์ฌ๋ฌ ๊ณณ์ ์ธ ๋ ์ ์ฉํ๋ค๋ ๊ฒ์ ์ ์ ์๋ค. 
            ์ด ๋, ChangeNotiferProvider๋ฅผ ์์ ฏํธ๋ฆฌ ์ต์๋จ์ ์์นํ๊ฒ ํ๋ฉด ๋๋ค.
            
            NotifyListener() : ViewModel ์์์ ๋ฐ์ดํฐ๊ฐ ๋ณ๊ฒฝ ๋  ๊ฒฝ์ฐ, ๋ฉ์๋๋ฅผ ํตํด ์๋ฆฐ๋ค.
            Provider.of<ChangeNotifer>(context) : ๋ณ๊ฒฝ๋ ์์ ฏ์ ์๋ ๊ฐฑ์  ์งํ
            
                
[Model] - ๋ฐ์ดํฐ์ ๋ฐ์ดํฐ๋ฅผ ์ฒ๋ฆฌํ๋ ๋ถ๋ฌธ _(ํ์ฌ ํ๋ก์ ํธ ํจํค์ง์์๋ service ๋ช์นญ์ ์ฌ์ฉ ์ค์ ์์)_
            - ViewModel๋ก ๋ถํฐ ๋ฐ์ ๋ฏธ์์ ํด๊ฒฐํ๋ ๋ก์ง ์์์ ์งํํ๋ค.
            - DB, File๋ก ๋ถํฐ ๋ฐ์ดํฐ๋ฅผ ๊ฐ์ ธ์ค๊ฑฐ๋ ์ ์กํด์ฃผ๋ ์ญํ ์ ํ๋ค. 
            
   
**Flutter์ Provider ๋ผ์ด๋ธ๋ฌ**
    - ๊ตฌ๊ธ์ด ์ถ์ฒํ๋ ์ํ๊ด๋ฆฌ(์ ์ญ์์ ์ฌ์ฉํ๋ ๋ฐ์ดํฐ๋ฅผ ๊ด๋ฆฌ) ๋ผ์ด๋ธ๋ฌ๋ฆฌ 
    - ๊ธฐ์กด์๋ setState์ ์ํด ํ์ ๋ชจ๋  ์์ ฏ์ด ๋ค์ ๋ฆฌ๋น๋ ๋์๋ค๋ฉด,
      provider ์ฌ์ฉ ์์๋ ๊ผญ ํ์ํ ์์ ฏ๋ง ๋ค์ ๊ทธ๋ ค์ง ์ ์๊ฒ ๋๋ค.  (์ฑ๋ฅ ํฅ์)

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
