import { FastifyReply, FastifyRequest } from 'fastify'
import { hash } from 'bcryptjs'
import { prisma } from '@/lib/prisma'
import { z } from 'zod'

export async function register(request: FastifyRequest, reply: FastifyReply) {
  const registerBodySchema = z.object({
    name: z.string(),
    lastname: z.string(),
    nick: z.string(),
    password: z.string().min(6),
    email: z.string().email(),
    cellPhone: z.string(),
  })

  const { name, lastname, nick, password, email, cellPhone } =
    registerBodySchema.parse(request.body)

  const password_hash = await hash(password, 6)

  const userWithSameEmail = await prisma.user.findUnique({
    where: {
      email,
    },
  })

  if (userWithSameEmail) {
    return reply.status(409).send()
  }

  await prisma.user.create({
    data: {
      name,
      lastname,
      nick,
      password: password_hash,
      email,
      cellPhone,
    },
  })

  return reply.status(201).send()
}
