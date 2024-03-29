#!/usr/bin/python3
from wsgiref.handlers import CGIHandler
from flask import Flask, render_template, request, redirect, url_for
import psycopg2
import psycopg2.extras

## SGBD configs
DB_HOST="db.tecnico.ulisboa.pt"
DB_USER=""
DB_DATABASE=DB_USER
DB_PASSWORD=""
DB_CONNECTION_STRING = "host=%s dbname=%s user=%s password=%s" % (DB_HOST, DB_DATABASE, DB_USER, DB_PASSWORD)

app = Flask(__name__)

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/new_category", methods=["POST"])
def create_category():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        name = request.form["nome"]
        data = (name,)
        query = "INSERT INTO categoria VALUES (%s);"
        cursor.execute(query, data)
        query = "INSERT INTO categoria_simples VALUES (%s);"
        cursor.execute(query, data)
        app.logger.info(query)
        return redirect(url_for("index"))
    except Exception as e:
        return str(e)
    finally:
        dbConn.commit()
        cursor.close()
        dbConn.close()

@app.route("/delete_category", methods=["POST"])
def delete_category():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        name = request.form["nome"]
        data = (name,)
        query = "DELETE FROM evento_reposicao\
                 WHERE EXISTS (SELECT *\
                               FROM planograma\
                               WHERE EXISTS (SELECT nome\
                                             FROM prateleira\
                                             WHERE nome = %s));"
        cursor.execute(query, data)
        query = "DELETE FROM planograma\
                 WHERE EXISTS (SELECT nome\
                               FROM prateleira\
                               WHERE nome = %s);"
        cursor.execute(query, data)
        query = "DELETE FROM categoria_simples WHERE nome = %s;"
        cursor.execute(query, data)
        query = "DELETE FROM super_categoria WHERE nome = %s;"
        cursor.execute(query, data)

        query = "DELETE FROM tem_outra WHERE categoria = %s OR super_categoria = %s;"
        data = (name, name)
        cursor.execute(query, data)

        query = "DELETE FROM tem_categoria WHERE nome = %s;"
        data = (name,)
        cursor.execute(query, data)
        query = "DELETE FROM prateleira WHERE nome = %s;"
        cursor.execute(query, data)
        query = "DELETE FROM responsavel_por WHERE nome_cat = %s;"
        cursor.execute(query, data)
        query = "DELETE FROM categoria WHERE nome = %s;"
        cursor.execute(query, data)
        return redirect(url_for("index"))
    except Exception as e:
        return str(e)
    finally:
        dbConn.commit()
        cursor.close()
        dbConn.close()

@app.route("/new_subcategory", methods=["POST"])
def create_subcategory():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        name = request.form["nome"]
        super_name = request.form["super_nome"]

        query = "DELETE FROM categoria_simples\
                 WHERE nome = %s;"
        data = (super_name,)
        cursor.execute(query, data)

        query = "INSERT INTO super_categoria VALUES (%s)\
                 ON CONFLICT(nome) DO NOTHING;" 
        cursor.execute(query, data)
        query = "INSERT INTO tem_outra VALUES (%s, %s);"
        data = (super_name, name)
        cursor.execute(query, data)
        return redirect(url_for("index"))
    except Exception as e:
        return str(e)
    finally:
        dbConn.commit()
        cursor.close()
        dbConn.close()

@app.route("/delete_subcategory", methods=["POST"])
def delete_subcategory():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        name = request.form["nome"]
        super_name = request.form["super_nome"]
        query = "DELETE \
                 FROM tem_outra\
                 WHERE categoria=%s AND super_categoria=%s;"
        data = (name, super_name)
        cursor.execute(query, data)
        query = "DELETE \
                 FROM super_categoria\
                 WHERE NOT EXISTS (SELECT super_categoria\
                                   FROM tem_outra\
                                   WHERE super_categoria=%s);" 
        data = (super_name,)
        cursor.execute(query, data)
        query = "INSERT INTO categoria_simples VALUES(%s)\
                 ON CONFLICT(nome) DO NOTHING;"
        cursor.execute(query, data)
        return redirect(url_for("index"))
    except Exception as e:
        return str(e)
    finally:
        dbConn.commit()
        cursor.close()
        dbConn.close()

@app.route("/new_retailer", methods=["POST"])
def create_retailer():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        query = "INSERT INTO retalhista VALUES (%s, %s);"
        tin = request.form["tin"]
        name = request.form["nome"]
        data = (tin, name)
        cursor.execute(query, data)
        app.logger.info(query)
        return redirect(url_for("index"))
    except Exception as e:
        return str(e)
    finally:
        dbConn.commit()
        cursor.close()
        dbConn.close()

@app.route("/delete_retailer", methods=["POST"])
def delete_retailer():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        tin = request.form["tin"]
        data = (tin,)
        query = "DELETE FROM evento_reposicao WHERE tin = %s;"
        cursor.execute(query, data)
        query = "DELETE FROM responsavel_por WHERE tin = %s;"
        cursor.execute(query, data)
        query = "DELETE FROM retalhista WHERE tin = %s;"
        cursor.execute(query, data)
        return redirect(url_for("index"))
    except Exception as e:
        return str(e)
    finally:
        dbConn.commit()
        cursor.close()
        dbConn.close()

@app.route("/list_replenishment_events")
def list_replenishment_events():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        query = "SELECT nome, unidades\
                 FROM evento_reposicao NATURAL JOIN prateleira\
                 WHERE num_serie = %s AND fabricante = %s;"
        serial_number = request.args.get("num_serie")
        manufacturer = request.args.get("fabricante")
        data = (serial_number, manufacturer)
        cursor.execute(query, data)
        return render_template("replenishment_events.html", cursor=cursor, serial_number = serial_number, manufacturer = manufacturer)
    except Exception as e:
        return str(e)  # Renders a page with the error.
    finally:
        cursor.close()
        dbConn.close()

@app.route("/list_subcategories")
def list_subcategories():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        query = "WITH RECURSIVE sub_categorias AS (\
                     SELECT categoria\
                     FROM tem_outra\
                     WHERE super_categoria = %s\
                 UNION ALL\
                     SELECT tem_outra.categoria\
                     FROM tem_outra\
                         JOIN sub_categorias ON tem_outra.super_categoria = sub_categorias.categoria\
                 )\
                 SELECT categoria FROM sub_categorias;"
        name = request.args.get("nome")
        data = (name,)
        cursor.execute(query, data)
        return render_template("subcategories.html", cursor=cursor, name=name)
    except Exception as e:
        return str(e)  # Renders a page with the error.
    finally:
        cursor.close()
        dbConn.close()

CGIHandler().run(app)
