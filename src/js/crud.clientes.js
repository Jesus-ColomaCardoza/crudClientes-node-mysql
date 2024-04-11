const userInfo=document.getElementById('user-info')
const userInfoForm=document.getElementById('user-info-form');

const dni=document.getElementById('user-info-dni');
const nombres=document.getElementById('user-info-nombres');
const apellidos=document.getElementById('user-info-apellidos');
const edad=document.getElementById('user-info-edad');
const peso=document.getElementById('user-info-peso');
const talla=document.getElementById('user-info-talla');

const contentUsers=document.getElementById('content-users');
const userInfoButton=document.getElementById('user-info-button');
const userInfoTitle=document.getElementById('user-info-title');

userInfo.addEventListener('click',(e)=>{
    if(e.target.classList.contains('button--cancel')){
        userInfoButton.textContent='Nuevo Cliente';
        userInfoTitle.textContent='Nuevo Cliente';
        dni.value='';
        nombres.value='';
        apellidos.value='';
        edad.value='';
        peso.value='';
        talla.value='';
        userInfoForm.action=`/agregar-cliente`;
    }
});
contentUsers.addEventListener('click',(e)=>{
    if (e.target.classList.contains('button--edit')){
        userInfoButton.textContent='Actualizar Cliente';
        userInfoTitle.textContent='Actualizar Cliente';
        dni.value=e.target.parentElement.children[0].textContent;
        nombres.value=e.target.parentElement.children[1].textContent;
        apellidos.value=e.target.parentElement.children[2].textContent;
        edad.value=e.target.parentElement.children[3].textContent;
        peso.value=e.target.parentElement.children[4].textContent;
        talla.value=e.target.parentElement.children[5].textContent;
        userInfoForm.action=`/actualizar-cliente/${e.target.parentElement.dataset.id}`;
    }else if(e.target.classList.contains('button--delete')){
        fetch(`/eliminar-cliente/${e.target.parentElement.dataset.id}`,{
            method:'DELETE',
        })
        .then(res=>res.json())
        .then(data=>{
            if (data.ok) location.reload();
        })
    }
})
userInfoForm.addEventListener('submit',(e)=>{
    e.preventDefault();
    if(dni.value.trim()!='' && nombres.value.trim()!='' && apellidos.value.trim()!='' && edad.value.trim()!='' && peso.value.trim()!='' && talla.value.trim()!=''){
        e.target.submit()
    }
});